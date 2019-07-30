<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTeachingDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('teaching_data', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_teacher');
            $table->foreign('id_teacher')->references('id_user')->on('teachers');
            $table->integer('day')->length(1);
            $table->unsignedBigInteger('id_class');
            $table->foreign('id_class')->references('id')->on('class');
            $table->unsignedBigInteger('id_subject');
            $table->foreign('id_subject')->references('id')->on('subjects');
            $table->unsignedBigInteger('id_room');
            $table->foreign('id_room')->references('id')->on('rooms');
            $table->time('time_in')->nullable();
            $table->time('time_out')->nullable();
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
        Schema::dropIfExists('teaching_data');
    }
}
