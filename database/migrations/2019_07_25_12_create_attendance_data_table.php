<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAttendanceDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('attendance_data', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_students');
            $table->foreign('id_students')->references('id_user')->on('students')->onDelete('cascade');
            $table->unsignedBigInteger('id_attendance');
            $table->foreign('id_attendance')->references('id')->on('attendance')->onDelete('cascade');
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
        Schema::dropIfExists('attendance_data');
    }
}
