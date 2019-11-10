<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTestQuestionItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('test_question_items', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_question');
            $table->longText('question');
            $table->longText('answer');
            $table->bigInteger('is_correct');

            $table->foreign('id_question')->references('id')->on('test_questions')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('test_question_items');
    }
}
