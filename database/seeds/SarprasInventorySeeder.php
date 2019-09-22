<?php

use Illuminate\Database\Seeder;

use Faker\Factory as Faker;

use App\SarprasInventory;

class SarprasInventorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('id_ID');

        for($i = 1; $i <= 10; $i++){
            $inventory = new SarprasInventory;
            $inventory->image = 'proyektor.jpg';
            $inventory->code = 'PRYK-'.$i;
            $inventory->name = 'Proyektor '.$i;
            $inventory->status = "Tersedia";
            $inventory->save();
        }
        for($i = 1; $i <= 10; $i++){
            $inventory = new SarprasInventory;
            $inventory->image = 'stopkontak.jpg';
            $inventory->code = 'STPK-'.$i;
            $inventory->name = 'Stopkontak '.$i;
            $inventory->status = "Tersedia";
            $inventory->save();
        }
    }
}
