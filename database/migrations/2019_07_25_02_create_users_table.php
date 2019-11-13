<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

use Illuminate\Support\Facades\Hash;

use App\User;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->text('image')->nullable();
            $table->string('email')->length(100)->unique();
            $table->string('username')->length(50);
            $table->string('password');
            $table->integer('balance')->length(10);
            $table->unsignedBigInteger('role');
            $table->foreign('role')->references('id')->on('roles')->onDelete('cascade');
            $table->timestamp('email_verified_at')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });

        User::create([
            'image' => 'administrator.png',
            'email' => 'admin@starbhak.com',
            'username' => 'administrator',
            'password' => Hash::make('supersecret'),
            'balance' => 0,
            'role' => 1,
        ]);

        User::create([
            'image' => 'admin-kesiswaan.png',
            'email' => 'admin-kesiswaan@starbhak.com',
            'username' => 'adminkesiswaan',
            'password' => Hash::make('supersecret'),
            'balance' => 0,
            'role' => 2,
        ]);

        User::create([
            'image' => 'admin-kurikulum.png',
            'email' => 'admin-kurikulum@starbhak.com',
            'username' => 'adminkurikulum',
            'password' => Hash::make('supersecret'),
            'balance' => 0,
            'role' => 3,
        ]);

        User::create([
            'image' => 'admin-sarpras.png',
            'email' => 'admin-sarpras@starbhak.com',
            'username' => 'adminsarpras',
            'password' => Hash::make('supersecret'),
            'balance' => 0,
            'role' => 4,
        ]);

        User::create([
            'image' => 'admin-kantin.png',
            'email' => 'admin-kantin@starbhak.com',
            'username' => 'adminkantin',
            'password' => Hash::make('supersecret'),
            'balance' => 100000,
            'role' => 5,
        ]);

        User::create([
            'image' => 'guru.png',
            'email' => 'guru@starbhak.com',
            'username' => 'guru',
            'password' => Hash::make('supersecret'),
            'balance' => 0,
            'role' => 6,
        ]);

        User::create([
            'image' => 'siswa.png',
            'email' => 'siswa@starbhak.com',
            'username' => 'siswa',
            'password' => Hash::make('supersecret'),
            'balance' => 10000,
            'role' => 7,
        ]);

        User::create([
            'image' => 'penjual.png',
            'email' => 'penjual@starbhak.com',
            'username' => 'penjual',
            'password' => Hash::make('supersecret'),
            'balance' => 10000,
            'role' => 8,
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
