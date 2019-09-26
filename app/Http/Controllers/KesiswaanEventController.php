<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Response;

use App\KesiswaanEvent;

class KesiswaanEventController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $count = KesiswaanEvent::count();
        $event = KesiswaanEvent::all();
        return view('administrator/kesiswaan/event/index')
        ->withCounts($count)
        ->withEvents($event);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('administrator/kesiswaan/event/create');
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
            'name' => 'required',
            'description' => 'required',
            'date' => 'required',
        ]);

        $multiple = $request->has('multiple');

        $event = new KesiswaanEvent;
        $event->name = $request->post('name');
        $event->description = $request->post('description');
        $event->date = $request->post('date');
        $event->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/kesiswaan/events');
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
        $event = KesiswaanEveny::find($id);
        return view('administrator/kesiswaan/event/show')
        ->withEvent($event);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $event = KesiswaanEvent::find($id);
        return view('administrator/kesiswaan/event/update')
        ->withEvent($event);
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
        $event = KesiswaanEvent::find($id);
        $event->name = $request->post('name');
        $event->description = $request->post('description');
        $event->date = $request->post('date');
        $event->save();

        return redirect('dashboard/kesiswaan/events');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $event = KesiswaanEvent::find($id);
        $event->delete();
        return Response::json($event);
    }
}
