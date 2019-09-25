<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

use App\Student;

class CreateStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->unsignedBigInteger('id_user')->unique();
            $table->foreign('id_user')->references('id')->on('users')->onDelete('cascade');
            $table->string('nipd')->length(20);
            $table->string('nisn')->length(20);
            $table->unsignedBigInteger('id_class');
            $table->foreign('id_class')->references('id')->on('class')->onDelete('cascade');
            $table->timestamps();
        });

        Student::create([
            'id_user' => '7',
            'nipd' => '123456789',
            'nisn' => '123456789',
            'id_class' => 1
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('students');
    }
}
