<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Response;

use App\Room;

class RoomController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('administrator');
        // $this->middleware('admin.sarpras');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $count = Room::count();
        $rooms = Room::paginate(20);
        return view('room/index')
        ->withCounts($count)
        ->withRooms($rooms);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('room/create');
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
            'code' => 'required',
            'alias' => 'required',
        ]);

        $multiple = $request->has('multiple');

        $room = new Room;
        $room->code = $request->post('code');
        $room->alias = $request->post('alias');
        $room->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/room');
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
        $room = Room::find($id);
        return view('room/update')
        ->withRoom($room);
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
        $validatedData = $request->validate([
            'code' => 'required',
            'alias' => 'required',
        ]);

        $room = Room::find($id);
        $room->code = $request->post('code');
        $room->alias = $request->post('alias');
        $room->save();
        return redirect('dashboard/room');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $room = Room::find($id);
        $room->delete();
        return Response::json($room);
    }
}
