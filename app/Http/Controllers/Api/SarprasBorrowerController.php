<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use DB, Crypt;
use JWTAuth;

use App\SarprasInventory;
use App\SarprasBorrower;

class SarprasBorrowerController extends Controller
{
    public static function response($code, $message, $data = null)
    {
        if (isset($data)) {
            return response()->json([
                'code' => $code,
                'message' => $message,
                'data' => $data
            ], $code);
        }

        return response()->json([
            'code' => $code,
            'message' => $message,
        ], $code);
    }

    public function borrow() {
        $request = $_GET['id'];
        $id = Crypt::decryptString($request);
        $token = JWTAuth::getToken();

        DB::transaction(function() {
            $inventory = SarprasInventory::find($id);
            $inventory->status = "Dipinjam";
            $inventory->save();

            $borrower = new SarprasBorrower;
            $borrower->id_user = JWTAuth::toUser($token)->id;
            $borrower->id_inventory = $id;
            $borrower->id_room = 1;
            $borrower->status = "Belum Dikembalikan";
            $borrower->save();
        });

        return $this::response(200, 'success');
    }
}
