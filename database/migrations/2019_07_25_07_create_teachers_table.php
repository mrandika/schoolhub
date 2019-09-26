<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

use App\Teacher;

class CreateTeachersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('teachers', function (Blueprint $table) {
            $table->unsignedBigInteger('id_user')->unique();
            $table->foreign('id_user')->references('id')->on('users')->onDelete('cascade');
            $table->string('nip')->length(50);
            $table->timestamps();
        });

        Teacher::create([
            'id_user' => 6,
            'nip' => 123456789
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('teachers');
    }
}
