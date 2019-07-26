<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

use App\Role;

class CreateRolesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('roles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name', 50);
            $table->timestamps();
        });

        Role::create(['name' => 'Administrator']);
        Role::create(['name' => 'Admin Kesiswaan']);
        Role::create(['name' => 'Admin Kurikulum']);
        Role::create(['name' => 'Admin Sarpras']);
        Role::create(['name' => 'Admin Kantin']);
        Role::create(['name' => 'Guru']);
        Role::create(['name' => 'Siswa']);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('roles');
    }
}
