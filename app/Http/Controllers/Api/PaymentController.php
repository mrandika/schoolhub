<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use DB, Crypt;
use JWTAuth;

use App\User;
use App\KantinInventory;
use App\KantinShop;
use App\KantinPayment;

class PaymentController extends Controller
{
    public function buy(Request $request) {
        $request = $_GET['id'];
        $id = Crypt::decryptString($request);

        $token = JWTAuth::getToken();
        $id_buyer = JWTAuth::toUser($token)->id;

        $inventory = KantinInventory::find($id);
        $price = $inventory->price;
        $id_shop = $inventory->id_shop;

        $shop = KantinShop::find($id_shop);
        $seller = $shop->id_owner;

        // $quantity = $request->post('qty');
        $quantity = 1;
        $total = (int) $price * (int) $quantity;

        DB::transaction(function() use ($seller, $id_buyer, $inventory, $quantity, $total) {
            $payment = new KantinPayment;
            $payment->id_seller = $seller;
            $payment->id_buyer = $id_buyer;
            $payment->id_inventory = $inventory->id;
            $payment->qty = $quantity;
            $payment->total = $total;
            $payment->save();

            // UPDATE BALANCE WITH SPECIFIED TOTAL
            $buyer = User::find($id_buyer);
            $buyer->balance = $buyer->balance - $total;
            $buyer->save();

            $seller = User::find($seller);
            $seller->balance = $seller->balance + $total;
            $seller->save();
        });
    }
}
