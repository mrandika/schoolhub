<?php

use Illuminate\Database\Seeder;

use Faker\Factory as Faker;

use App\Teacher;
use App\StudentClass;

class ClassSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('id_ID');

        for($i = 1; $i <= Teacher::count(); $i++){
            $class = new StudentClass;
            $class->name = $faker->numberBetween($min = 10, $max = 12).' RPL '.$i;
            $class->id_teacher = $faker->numberBetween($min = 9, $max = Teacher::select('id_user')->orderBy('id_user', 'desc')->first()->id_user);
            $class->save();
        }
    }
}
