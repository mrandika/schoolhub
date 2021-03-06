<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

use App\KantinShop;

class CreateKantinShopsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kantin_shops', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_owner');
            $table->foreign('id_owner')->references('id')->on('users')->onDelete('cascade');
            $table->string('name')->length('100');
            $table->text('image');
            $table->text('description');
            $table->timestamps();
        });

        KantinShop::create([
            'id_owner' => 8,
            'name' => 'Warung Penjual',
            'image' => 'warungpenjual.png',
            'description' => 'Warung Penjual lorem dorem.'
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('kantin_shops');
    }
}
