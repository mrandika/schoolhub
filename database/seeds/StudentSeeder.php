<?php

use Illuminate\Database\Seeder;

use Faker\Factory as Faker;

use App\User;
use App\UserData;
use App\Student;
use App\StudentClass;

class StudentSeeder extends Seeder
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
            $role = 7;
            $balance = 0;
            $password = 'supersecret';

            $user = new User;
            $user->id = $id;
            $user->image = '8_ANDIKA.png';
            $user->email = $faker->email;
            $user->username = $faker->userName;
            $user->password = $password;
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

            $students = new Student;
            $students->id_user = $id;
            $students->nisn = $faker->numberBetween($min = 00000000000, $max = 999999999);
            $students->nipd = $faker->numberBetween($min = 00000000000, $max = 999999999);
            $students->id_class = $faker->numberBetween($min = 1, $max = StudentClass::count());
            $students->save();
        }

    }
}
