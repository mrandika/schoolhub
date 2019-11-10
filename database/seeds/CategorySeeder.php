<?php

use Illuminate\Database\Seeder;

use App\BlogCategory;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = [
            ['id_user' => 1, 'name' => 'Informasi'],
            ['id_user' => 1, 'name' => 'Pemberitahuan'],
            ['id_user' => 1, 'name' => 'Pengumuman'],
        ];

        foreach ($categories as $category) {
            BlogCategory::create([
                'id_user' => $category['id_user'],
                'name' => $category['name']
            ]);
        }
    }
}
