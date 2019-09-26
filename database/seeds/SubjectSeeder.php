<?php

use Illuminate\Database\Seeder;

use Faker\Factory as Faker;

use App\Subject;

class SubjectSeeder extends Seeder
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
            $subject = new Subject;
            $subject->code = 'MP-'.$i;
            $subject->name = 'Mata Pelajaran '.$i;
            $subject->type = 'C'.$faker->numberBetween($min = 1, $max = 3);
            $subject->minimum = $faker->numberBetween($min = 75, $max = 80);
            $subject->save();
        }
    }
}
