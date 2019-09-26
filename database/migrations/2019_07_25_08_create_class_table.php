<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

use App\StudentClass;

class CreateClassTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('class', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_teacher');
            $table->foreign('id_teacher')->references('id_user')->on('teachers')->onDelete('cascade');
            $table->string('name')->length(50);
            $table->timestamps();
        });

        StudentClass::create([
            'id_teacher' => 6,
            'name' => 'KELAS COBA'
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('classes');
    }
}
