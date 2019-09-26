<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateKesiswaanReportsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kesiswaan_reports', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_teacher');
            $table->foreign('id_teacher')->references('id_user')->on('teachers')->onDelete('cascade');
            $table->unsignedBigInteger('id_student');
            $table->foreign('id_student')->references('id_user')->on('students')->onDelete('cascade');
            $table->unsignedBigInteger('id_violation');
            $table->foreign('id_violation')->references('id')->on('kesiswaan_violation')->onDelete('cascade');
            $table->enum('status', ['Tervalidasi', 'Belum Tervalidasi']);
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
        Schema::dropIfExists('kesiswaan_reports');
    }
}
