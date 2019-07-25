<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTeachingAttendanceTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('teaching_attendance', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_teaching');
            $table->foreign('id_teaching')->references('id')->on('teaching_data');
            $table->text('section');
            $table->text('section_name');
            $table->enum('status', ['Hadir', 'Tidak Hadir', 'Dispensasi', 'Izin', 'Sakit', 'Absen']);
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
        Schema::dropIfExists('teaching_attendances');
    }
}
