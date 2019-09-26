<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateKantinPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kantin_payments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_seller');
            $table->foreign('id_seller')->references('id')->on('users')->onDelete('cascade');
            $table->unsignedBigInteger('id_buyer');
            $table->foreign('id_buyer')->references('id')->on('users')->onDelete('cascade');
            $table->unsignedBigInteger('id_inventory');
            $table->foreign('id_inventory')->references('id')->on('kantin_inventories')->onDelete('cascade');
            $table->integer('qty')->length(3);
            $table->integer('total')->length(10);
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
        Schema::dropIfExists('kantin_payments');
    }
}
