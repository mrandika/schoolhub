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

        for($y = 1; $y <= 10; $y++){
            $subject = new Subject;
            $subject->code = 'MP-'.$i.'-'.$y;
            $subject->name = 'Mata Pelajaran '.$i.'-'.$y;
            $subject->type = 'N';
            $subject->minimum = $faker->numberBetween($min = 75, $max = 80);
            $subject->save();
        }

        for($z = 1; $z <= 10; $z++){
            $subject = new Subject;
            $subject->code = 'MP-'.$i.'-'.$z;
            $subject->name = 'Mata Pelajaran '.$i.'-'.$z;
            $subject->type = 'L';
            $subject->minimum = $faker->numberBetween($min = 75, $max = 80);
            $subject->save();
        }

        for($q = 1; $q <= 10; $q++){
            $subject = new Subject;
            $subject->code = 'MP-'.$i.'-'.$q;
            $subject->name = 'Mata Pelajaran '.$i.'-'.$q;
            $subject->type = 'C';
            $subject->minimum = $faker->numberBetween($min = 75, $max = 80);
            $subject->save();
        }
    }
}