<?php

use Illuminate\Database\Seeder;

use Faker\Factory as Faker;

use App\KesiswaanViolation;

class KesiswaanViolationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('id_ID');

        for($i = 1; $i <= 20; $i++) {
            KesiswaanViolation::create([
                'name' => 'Pelanggaran Ke-'.$i,
                'score' => $faker->numberBetween($min = 10, $max = 100)
            ]);
        }
    }
}
