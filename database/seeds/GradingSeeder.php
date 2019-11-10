<?php

use Illuminate\Database\Seeder;

use App\StudentGrade;

class GradingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $grading = [
            [ 'id_teaching' => 1, 'id_students' => 7, 'section' => '3.1', 'section_name' => 'Pengenalan Database', 'score' => 80],
            [ 'id_teaching' => 1, 'id_students' => 7, 'section' => '3.2', 'section_name' => 'Database Tingkat Lanjut', 'score' => 78],
            [ 'id_teaching' => 1, 'id_students' => 7, 'section' => '3.3', 'section_name' => 'Penerapan Database', 'score' => 80],
            [ 'id_teaching' => 1, 'id_students' => 7, 'section' => '3.4', 'section_name' => 'Database dan PHP', 'score' => 70],
        ];

        foreach($grading as $grade) {
            StudentGrade::create([ 'id_teaching' => $grade['id_teaching'], 'id_students' => $grade['id_students'], 'section' => $grade['section'], 'section_name' => $grade['section_name'], 'score' => $grade['score']]);
        }
    }
}
