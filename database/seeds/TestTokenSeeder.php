<?php

use Illuminate\Database\Seeder;

use App\TestToken;

class TestTokenSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $tokens = [
            ['id_question' => 1, 'id_student' => 7, 'token' => 'PGNLNDB'],
            ['id_question' => 2, 'id_student' => 7, 'token' => 'DBTGTLNJT'],
        ];

        foreach($tokens as $token) {
            TestToken::create(['id_question' => $token['id_question'], 'id_student' => $token['id_student'], 'token' => $token['token']]);
        }
    }
}
