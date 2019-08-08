<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\UserData;
use App\SarprasInventory;
use App\Room;
use App\SarprasBorrower;
use App\ViewSarprasBorrower;

class SarprasBorrowerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $count = ViewSarprasBorrower::count();
        $countAvailable = ViewSarprasBorrower::where('status', 'Dikembalikan')->count();
        $countBorrow = ViewSarprasBorrower::where('status', 'Belum Dikembalikan')->count();
        $borrower = ViewSarprasBorrower::paginate(20);
        return view('administrator/sarpras/borrower/index')
        ->withCounts($count)
        ->withAvailable($countAvailable)
        ->withBorrowed($countBorrow)
        ->withBorrowers($borrower);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $user = UserData::all();
        $inventory = SarprasInventory::where('status', 'Tersedia')->get();
        $room = Room::all();
        return view('administrator/sarpras/borrower/create')
        ->withUsers($user)
        ->withInventories($inventory)
        ->withRooms($room);
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
            'id_user' => 'required',
            'id_inventory' => 'required',
            'id_room' => 'required',
        ]);

        $multiple = $request->has('multiple');

        $borrower = new SarprasBorrower;
        $borrower->id_user = $request->post('id_user');
        $borrower->id_inventory = $request->post('id_inventory');
        $borrower->id_room = $request->post('id_room');
        $borrower->status = "Belum Dikembalikan";
        $borrower->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/sarpras/borrower');
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $borrower = SarprasBorrower::find($id);
        $borrower->status = "Dikembalikan";
        $borrower->save();
        return redirect('dashboard/sarpras/borrower');
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
