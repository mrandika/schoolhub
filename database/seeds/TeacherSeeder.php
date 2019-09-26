<?php

use Illuminate\Database\Seeder;

use Faker\Factory as Faker;
use Illuminate\Support\Facades\Hash;

use App\User;
use App\UserData;
use App\Teacher;

class TeacherSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('id_ID');

        for($i = 1; $i <= 20; $i++){
            $id = User::count()+1;
            $role = 6;
            $balance = 0;
            $password = 'supersecret';

            $user = new User;
            $user->id = $id;
            $user->image = "8_ANDIKA.png";
            $user->email = $faker->email;
            $user->username = $faker->userName;
            $user->password = Hash::make($password);
            $user->balance = $balance;
            $user->role = $role;
            $user->save();

            $userData = new UserData;
            $userData->id_user = $id;
            $userData->name = $faker->name;;
            $userData->gender = '0';
            $userData->religion = '0';
            $userData->birthplace = '0';
            $userData->dob = '1970-01-01';
            $userData->address = '0';
            $userData->phone = '0';
            $userData->save();

            $teachers = new Teacher;
            $teachers->id_user = $id;
            $teachers->nip = $faker->numberBetween($min = 00000000000, $max = 999999999);
            $teachers->save();
        }
    }
}
