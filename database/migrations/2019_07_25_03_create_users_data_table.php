<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

use App\UserData;

class CreateUsersDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users_data', function (Blueprint $table) {
            $table->unsignedBigInteger('id_user')->unique();
            $table->foreign('id_user')->references('id')->on('users');
            $table->string('name')->length('100');
            $table->enum('gender', ['Laki-laki', 'Perempuan', '0']);
            $table->enum('religion', ['Islam', 'Kristen Prostan', 'Katolik', 'Buddha', 'Hindu', 'Kong Hu Chu', '0']);
            $table->string('birthplace')->length(50);
            $table->date('dob');
            $table->text('address');
            $table->string('phone')->length(17);
            $table->timestamps();
        });

        UserData::create([
            'id_user' => '1',
            'name' => 'Administrator',
            'gender' => '0',
            'religion' => '0',
            'birthplace' => '0',
            'dob' => '1970-01-01',
            'address' => '0',
            'phone' => '0'
        ]);

        UserData::create([
            'id_user' => '2',
            'name' => 'Admin Kesiswaan',
            'gender' => '0',
            'religion' => '0',
            'birthplace' => '0',
            'dob' => '1970-01-01',
            'address' => '0',
            'phone' => '0'
        ]);

        UserData::create([
            'id_user' => '3',
            'name' => 'Admin Kurikulum',
            'gender' => '0',
            'religion' => '0',
            'birthplace' => '0',
            'dob' => '1970-01-01',
            'address' => '0',
            'phone' => '0'
        ]);

        UserData::create([
            'id_user' => '4',
            'name' => 'Admin Sarpras',
            'gender' => '0',
            'religion' => '0',
            'birthplace' => '0',
            'dob' => '1970-01-01',
            'address' => '0',
            'phone' => '0'
        ]);

        UserData::create([
            'id_user' => '5',
            'name' => 'Admin Kantin',
            'gender' => '0',
            'religion' => '0',
            'birthplace' => '0',
            'dob' => '1970-01-01',
            'address' => '0',
            'phone' => '0'
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_data');
    }
}
