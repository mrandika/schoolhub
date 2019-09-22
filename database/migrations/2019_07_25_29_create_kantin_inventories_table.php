<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

use App\KantinInventory;

class CreateKantinInventoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kantin_inventories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_shop');
            $table->foreign('id_shop')->references('id')->on('kantin_shops')->onDelete('cascade');
            $table->string('name')->length('100');
            $table->text('image');
            $table->integer('price')->length(6);
            $table->integer('stock')->length(4);
            $table->timestamps();
        });

        KantinInventory::create([
            'id_shop' => 1,
            'name' => 'Makanan',
            'image' => 'makanan.png',
            'price' => 1000,
            'stock' => 10
        ]);

        KantinInventory::create([
            'id_shop' => 1,
            'name' => 'Minuman',
            'image' => 'minuman.png',
            'price' => 1000,
            'stock' => 10
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('kantin_inventories');
    }
}
