<?php

use Illuminate\Database\Seeder;
use App\KesiswaanReport;
use App\Notification;

class NotificationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $reports = KesiswaanReport::all();

        foreach($reports as $report) {
            $notification = new Notification;
            $notification->id_sender = 2;
            $notification->id_recepient = $report->id_student;
            $notification->type = 'warning';
            $notification->message = 'Sebuah pelanggaran atas nama anda telah terdaftar. Periksa halaman Pelanggaran Kesiswaan untuk melihat laporan ini.';
            $notification->save();
        }
    }
}
