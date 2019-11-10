<?php

use Illuminate\Database\Seeder;

use App\SarprasBorrower;

class StudentBorrow extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $borrower = [
            ['id_user' => 7, 'id_inventory' => 1, 'id_room' => 1, 'status' => 'Belum Dikembalikan'],
            ['id_user' => 7, 'id_inventory' => 2, 'id_room' => 1, 'status' => 'Belum Dikembalikan'],
            ['id_user' => 7, 'id_inventory' => 3, 'id_room' => 1, 'status' => 'Belum Dikembalikan'],
        ];

        foreach($borrower as $borrow) {
            SarprasBorrower::create(['id_user' => $borrow['id_user'], 'id_inventory' => $borrow['id_inventory'], 'id_room' => $borrow['id_room'], 'status' => $borrow['status']]);
        }
    }
}
