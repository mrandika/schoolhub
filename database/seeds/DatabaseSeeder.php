<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(TeacherSeeder::class);
        $this->call(ClassSeeder::class);
        $this->call(StudentSeeder::class);
        $this->call(RoomSeeder::class);
        $this->call(SubjectSeeder::class);
        $this->call(TeachingDataSeeder::class);
        $this->call(SarprasInventorySeeder::class);
    }
}
