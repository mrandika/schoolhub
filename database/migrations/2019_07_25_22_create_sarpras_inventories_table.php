<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSarprasInventoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sarpras_inventories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('code')->length(50);
            $table->text('name');
            $table->text('image');
            $table->enum('status', ['Dipinjam', 'Tersedia']);
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
        Schema::dropIfExists('sarpras_inventories');
    }
}
