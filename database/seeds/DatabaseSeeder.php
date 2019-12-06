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
        $this->call(KesiswaanViolationSeeder::class);
        $this->call(CategorySeeder::class);
        $this->call(GradingSeeder::class);
        $this->call(StudentReport::class);
        $this->call(StudentBorrow::class);
        $this->call(TestQuestionSeeder::class);
        $this->call(TestTokenSeeder::class);
        $this->call(TestQuestionItemSeeder::class);
        $this->call(NotificationSeeder::class);
    }
}
