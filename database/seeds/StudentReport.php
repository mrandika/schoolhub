<?php

use Illuminate\Database\Seeder;

use App\KesiswaanReport;

class StudentReport extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $reports = [
            ['id_teacher' => 6, 'id_student' => 7, 'id_violation' => 1, 'status' => 'Tervalidasi'],
            ['id_teacher' => 6, 'id_student' => 7, 'id_violation' => 2, 'status' => 'Tervalidasi'],
        ];

        foreach($reports as $report) {
            KesiswaanReport::create(['id_teacher' => $report['id_teacher'], 'id_student' => $report['id_student'], 'id_violation' => $report['id_violation'], 'status' => $report['status']]);
        }
    }
}
