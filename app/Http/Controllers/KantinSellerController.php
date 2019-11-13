<?php

namespace App\Http\Controllers;

use App\KantinInventory;
use App\KantinShop;
use App\Student;
use App\User;
use App\UserData;
use App\ViewKantinPayment;
use Auth;
use File;
use Hash;
use Illuminate\Http\Request;
use Response;
use Storage;

class KantinSellerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $seller = User::where('role', 8)->get();
        $counts = User::where('role', 8)->count();
        return view('kantin/seller/index')
            ->withCounts($counts)
            ->withSellers($seller);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('kantin/seller/create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'email' => 'required|unique:users|max:100',
            'username' => 'required|unique:users',
            'password' => 'required',
            'name' => 'required',
            'gender' => 'required',
            'religion' => 'required',
            'birthplace' => 'required',
            'dob' => 'required',
            'address' => 'required',
            'phone' => 'required|unique:users_data',
        ]);

        $id = User::count() + 1;
        $role = 8;
        $balance = 0;
        $password = Hash::make($request->get('password'));

        $multiple = $request->has('multiple');

        $image = $request->file('image');
        $imageExtension = $image->getClientOriginalExtension();
        $imageName = $id . "_" . $request->post('name') . '.' . $imageExtension;
        Storage::disk('public_userImage')->put($imageName, File::get($image));

        $user = new User;
        $user->id = $id;
        $user->image = $imageName;
        $user->email = $request->post('email');
        $user->username = $request->post('username');
        $user->password = $password;
        $user->balance = $balance;
        $user->role = $role;
        $user->save();

        $userData = new UserData;
        $userData->id_user = $id;
        $userData->name = $request->post('name');
        $userData->gender = $request->post('gender');
        $userData->religion = $request->post('religion');
        $userData->birthplace = $request->post('birthplace');
        $userData->dob = $request->post('dob');
        $userData->address = $request->post('address');
        $userData->phone = $request->post('phone');
        $userData->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/kantin/seller');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $shop = KantinShop::where('id_owner', $id)->first();

        $user = User::find($id);
        $userData = UserData::find($id);

        if ($shop) {
            $inventory = KantinInventory::where('id_shop', $shop->id)->get();

            return view('kantin/seller/show')
                ->withShop($shop)
                ->withInventories($inventory)
                ->withUser($user)
                ->withData($userData);
        } else {
            return view('kantin/seller/show');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find($id);
        $userData = UserData::find($id);
        return view('kantin/seller/update')
            ->withUser($user)
            ->withData($userData);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $password = Hash::make($request->get('password'));

        if ($request->post('image') != null) {
            Storage::disk('public_userImage')->delete($user->image);
            $image = $request->file('image');
            $imageExtension = $image->getClientOriginalExtension();
            $imageName = $id . "_" . $request->post('name') . '.' . $imageExtension;
            Storage::disk('public_userImage')->put($imageName, File::get($image));
            $user->image = $imageName;
        }

        $user = User::find($id);
        $user->email = $request->post('email');
        $user->username = $request->post('username');
        if ($request->post('password') != null) {
            $user->password = $password;
        }
        $user->save();

        $userData = UserData::find($id);
        $userData->id_user = $id;
        $userData->name = $request->post('name');
        $userData->gender = $request->post('gender');
        $userData->religion = $request->post('religion');
        $userData->birthplace = $request->post('birthplace');
        $userData->dob = $request->post('dob');
        $userData->address = $request->post('address');
        $userData->phone = $request->post('phone');
        $userData->save();

        return redirect('dashboard/kantin/seller');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $seller = User::find($id);
        $seller->delete();
        return Response::json($seller);
    }

    public function index_transaction()
    {
        $date = date("Y-m-d");
        $payment = ViewKantinPayment::where('id_seller', Auth::id())->where('created_at', 'like', '%'.$date.'%')->get();
        return view('kantin/seller/transaction_index')->with([
            'payments' => $payment
        ]);
    }

    public function create_transfer()
    {
        return view('kantin/seller/transfer');
    }

    public function store_transfer(Request $request)
    {
        $nisn = $request->post('nisn');
        $balance = $request->post('balance');

        $id_user = Student::where('nisn', $nisn)->first()->id_user;

        $seller = User::find(Auth::id());
        $seller->balance = $seller->balance - $balance;
        $seller->save();

        $user = User::find($id_user);
        $user->balance = $user->balance + $balance;
        $user->save();

        return view('today');
    }
}
