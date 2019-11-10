<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTestSessionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('test_sessions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_student');
            $table->unsignedBigInteger('id_token');
            $table->longtext('progress');
            $table->integer('score');
            $table->boolean('is_ongoing');
            $table->boolean('is_finished');

            $table->foreign('id_student')->references('id_user')->on('students');
            $table->foreign('id_token')->references('id')->on('test_tokens');
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
        Schema::dropIfExists('test_sessions');
    }
}
