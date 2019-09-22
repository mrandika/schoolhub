<?php

use Illuminate\Database\Seeder;

use Faker\Factory as Faker;

use App\Room;

class RoomSeeder extends Seeder
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
            $room = new Room;
            $room->code = $i;
            $room->alias = 'Ruang Teori '.$i;
            $room->save();
        }

        for($i = 1; $i <= 10; $i++){
            $room = new Room;
            $room->code = $i;
            $room->alias = 'Ruang Lab '.$i;
            $room->save();
        }
    }
}
