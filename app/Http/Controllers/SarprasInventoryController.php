<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use File, Storage, Response;

use App\SarprasInventory;

class SarprasInventoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $count = SarprasInventory::count();
        $countAvailable = SarprasInventory::where('status', 'Tersedia')->count();
        $countBorrow = SarprasInventory::where('status', 'Dipinjam')->count();
        $inventories = SarprasInventory::paginate(20);
        return view('administrator/sarpras/inventories/index')
        ->withCounts($count)
        ->withAvailable($countAvailable)
        ->withBorrowed($countBorrow)
        ->withInventories($inventories);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('administrator/sarpras/inventories/create');
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
            'code' => 'required|unique:sarpras_inventories|max:100',
            'name' => 'required',
        ]);

        $id = SarprasInventory::count()+1;

        $multiple = $request->has('multiple');

        $image = $request->file('image');
        $imageExtension = $image->getClientOriginalExtension();
        $imageName = $id."_".$request->post('name').'.'.$imageExtension;
        Storage::disk('public_sarprasInventoryImage')->put($imageName,  File::get($image));

        $inventory = new SarprasInventory;
        $inventory->image = $imageName;
        $inventory->code = $request->post('code');
        $inventory->name = $request->post('name');
        $inventory->status = "Tersedia";
        $inventory->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/sarpras/inventory');
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
        $inventory = SarprasInventory::find($id);
        return view('administrator/sarpras/inventories/show')
        ->withInventory($inventory);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $inventory = SarprasInventory::find($id);
        return view('administrator/sarpras/inventories/update')
        ->withInventory($inventory);
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
        $inventory = SarprasInventory::find($id);

        if ($request->post('image') != null) {
            Storage::disk('public_userImage')->delete($user->image);
            $image = $request->file('image');
            $imageExtension = $image->getClientOriginalExtension();
            $imageName = $id."_".$request->post('name').'.'.$imageExtension;
            Storage::disk('public_userImage')->put($imageName,  File::get($image));
            $inventory->image = $imageName;
        }

        $inventory->code = $request->post('code');
        $inventory->name = $request->post('name');
        $inventory->status = $request->post('status');;
        $inventory->save();

        return redirect('dashboard/sarpras/inventory');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $inventory = SarprasInventory::find($id);
        $inventory->delete();
        return Response::json($inventory);
    }
}
