<?php

use Illuminate\Database\Seeder;

use App\TestQuestion;

class TestQuestionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $questions = [
            ['id_teaching' => 1, 'section' => '3.1', 'section_name' => '[UH] Pengenalan Database'],
            ['id_teaching' => 1, 'section' => '3.2', 'section_name' => '[UH] Database Tingkat Lanjut'],
        ];  

        foreach($questions as $question) {
            TestQuestion::create(['id_teaching' => $question['id_teaching'], 'section' => $question['section'], 'section_name' => $question['section_name']]);
        }
    }
}
