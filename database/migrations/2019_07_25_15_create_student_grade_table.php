<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStudentGradeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_grade', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_teaching');
            $table->foreign('id_teaching')->references('id')->on('teaching_data')->onDelete('cascade');
            $table->unsignedBigInteger('id_students');
            $table->foreign('id_students')->references('id_user')->on('students')->onDelete('cascade');
            $table->text('section');
            $table->text('section_name');
            $table->double('score');
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
        Schema::dropIfExists('student_grades');
    }
}
