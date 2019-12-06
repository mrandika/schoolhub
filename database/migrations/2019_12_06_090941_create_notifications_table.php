<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNotificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notifications', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->enum('type', ['message', 'alert', 'warning']);
            $table->unsignedBigInteger('id_sender');
            $table->unsignedBigInteger('id_recepient');
            $table->longText('message');
            $table->boolean('viewed')->default(0);

            $table->foreign('id_sender')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('id_recepient')->references('id')->on('users')->onDelete('cascade');
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
        Schema::dropIfExists('notifications');
    }
}
