<?php

use Illuminate\Database\Seeder;

use Faker\Factory as Faker;

use App\TeachingData;

class TeachingDataSeeder extends Seeder
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
            $teaching = new TeachingData;
            $teaching->id_teacher = $faker->numberBetween($min = 9, $max = 28);
            $teaching->id_subject = $faker->numberBetween($min = 1, $max = 20);
            $teaching->id_class = $faker->numberBetween($min = 1, $max = 20);
            $teaching->id_room = $faker->numberBetween($min = 1, $max = 20);
            $teaching->day = $faker->numberBetween($min = 1, $max = 6);
            $teaching->time_in = '07:00';
            $teaching->time_out = '12:00';
            $teaching->save();
        }

        for($i = 1; $i <= 5; $i++) {
            $teaching = new TeachingData;
            $teaching->id_teacher = $faker->numberBetween($min = 9, $max = 28);
            $teaching->id_subject = $faker->numberBetween($min = 1, $max = 20);
            $teaching->id_class = 1;
            $teaching->id_room = $faker->numberBetween($min = 1, $max = 20);
            $teaching->day = $faker->numberBetween($min = 1, $max = 6);
            $teaching->time_in = '07:00';
            $teaching->time_out = '12:00';
            $teaching->save();
        }

        for($i = 1; $i <= 5; $i++) {
            $teaching = new TeachingData;
            $teaching->id_teacher = 6;
            $teaching->id_subject = $faker->numberBetween($min = 1, $max = 20);
            $teaching->id_class = 1;
            $teaching->id_room = $faker->numberBetween($min = 1, $max = 20);
            $teaching->day = $faker->numberBetween($min = 1, $max = 6);
            $teaching->time_in = '07:00';
            $teaching->time_out = '12:00';
            $teaching->save();
        }
    }
}
