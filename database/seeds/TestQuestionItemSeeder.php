<?php

use Illuminate\Database\Seeder;

use App\TestQuestionItem;

class TestQuestionItemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $answer = array(

            array(
                'id' => 1,
                'text' => 'Benar'
            ),
            array(
                'id' => 2,
                'text' => 'Salah'
            ),
            array(
                'id' => 3,
                'text' => 'Salah'
            ),
            array(
                'id' => 4,
                'text' => 'Salah'
            ),
            array(
                'id' => 5,
                'text' => 'Salah'
            )

        );

        for($i = 1; $i <= 10; $i++) {
            TestQuestionItem::create([
                'id_question' => 1,
                'question' => 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!',
                'answer' => json_encode($answer),
                'is_correct' => 1
            ]);

            TestQuestionItem::create([
                'id_question' => 2,
                'question' => 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!',
                'answer' => json_encode($answer),
                'is_correct' => 1
            ]);
        }
    }
}
