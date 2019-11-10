<?php

namespace App\Imports;

use App\TestQuestion;
use App\TestQuestionItem;
use Maatwebsite\Excel\Concerns\ToModel;

class TestQuestionItemImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        $question = TestQuestion::latest('id')->first();
        $answer = array(

            array(
                'id' => 1,
                'text' => $row[1]
            ),
            array(
                'id' => 2,
                'text' => $row[2]
            ),
            array(
                'id' => 3,
                'text' => $row[3]
            ),
            array(
                'id' => 4,
                'text' => $row[4]
            ),
            array(
                'id' => 5,
                'text' => $row[5]
            )

        );

        return new TestQuestionItem([
            'id_question' => $question->id,
            'question' => $row[0],
            'answer' => json_encode($answer),
            'is_correct' => $row[6]
        ]);
    }
}