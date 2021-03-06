@section('dashboardNavigationList')
@php
$role = Auth::user()->role;
@endphp

{{-- For admin --}}
@if ($role == 1)
<li class=@yield('todayActive')><a class="nav-link" href="{{action('HomeController@index')}}"><i class="fas fa-pen"></i>
                <span>Today</span></a></li>

<li class="menu-header">Data Pengguna</li>
<li class=@yield('teacherActive')><a class="nav-link" href="{{action('TeacherController@index')}}"><i
                        class="fas fa-chalkboard-teacher"></i>
                <span>Guru</span></a></li>
<li class=@yield('studentActive')><a class="nav-link" href="{{action('StudentController@index')}}"><i
                        class="fas fa-book-reader"></i>
                <span>Siswa</span></a></li>
<li class=@yield('sessionActive')><a class="nav-link" href="{{action('SessionController@index')}}"><i
                        class="far fa-clock"></i>
                <span>Sesi</span></a></li>

<li class="menu-header">Data Pembelajaran</li>
<li class=@yield('roomActive')><a class="nav-link" href="{{action('RoomController@index')}}"><i class="fas fa-key"></i>
                <span>Ruangan</span></a></li>
<li class=@yield('classActive')><a class="nav-link" href="{{action('ClassController@index')}}"><i
                        class="fas fa-key"></i>
                <span>Kelas</span></a></li>
<li class=@yield('subjectActive')><a class="nav-link" href="{{action('SubjectController@index')}}"><i
                        class="fas fa-book"></i>
                <span>Mata Pelajaran</span></a></li>
<li class=@yield('teachingActive')><a class="nav-link" href="{{action('TeachingController@index')}}"><i
                        class="fas fa-book"></i>
                <span>Pengajar</span></a></li>
<li class=@yield('presenceActive')><a class="nav-link" href="{{action('PresenceController@index')}}"><i
                        class="fas fa-user-check"></i>
                <span>Presensi</span></a></li>
<li class=@yield('noteActive')><a class="nav-link" href="{{action('NoteController@index')}}"><i
                        class="fas fa-sticky-note"></i>
                <span>Catatan</span></a></li>

<li class="menu-header">Sarpras</li>
<li class=@yield('inventoryActive')><a class="nav-link" href="{{action('SarprasInventoryController@index')}}"><i
                        class="fas fa-cubes"></i>
                <span>Data Barang</span></a></li>
<li class=@yield('borrowDataActive')><a class="nav-link" href="{{action('SarprasBorrowerController@index')}}"><i
                        class="fas fa-list"></i>
                <span>Data Peminjaman</span></a></li>

<li class="menu-header">Kesiswaan</li>
<li class=@yield('eventActive')><a class="nav-link" href="{{action('KesiswaanEventController@index')}}"><i
                        class="fas fa-ticket-alt"></i>
                <span>Acara</span></a></li>
<li class=@yield('violationActive')><a class="nav-link" href="{{action('KesiswaanViolationController@index')}}"><i
                        class="fas fa-exclamation"></i>
                <span>Pelanggaran</span></a></li>
<li class=@yield('reportActive')><a class="nav-link" href="{{action('KesiswaanReportController@index')}}"><i
                        class="fas fa-list"></i>
                <span>Data Pelanggaran</span></a></li>

<li class="menu-header">Kantin</li>
<li class=@yield('sellerActive')><a class="nav-link" href="{{action('KantinSellerController@index')}}"><i
                        class="fas fa-ticket-alt"></i>
                <span>Penjual</span></a></li>

<li class="menu-header">Data Blog</li>
<li class=@yield('postActive')><a class="nav-link" href="{{action('PostController@index')}}"><i class="fas fa-pen"></i>
                <span>Post</span></a></li>
{{-- <li class=@yield('categoryActive')><a class="nav-link" href="{{action('CategoryController@index')}}"><i
        class="fas fa-pen"></i>
<span>Kategori</span></a></li>
<li class=@yield('tagActive')><a class="nav-link" href="{{action('TagController@index')}}"><i class="fas fa-pen"></i>
                <span>Tag</span></a></li> --}}
@endif

{{-- For Kesiswaan Admin --}}
@if ($role == 2)
<li class=@yield('todayActive')><a class="nav-link" href="{{action('HomeController@index')}}"><i class="fas fa-pen"></i>
                <span>Today</span></a></li>
<li class="menu-header">Kesiswaan</li>
<li class=@yield('eventActive')><a class="nav-link" href="{{action('KesiswaanEventController@index')}}"><i
                        class="fas fa-ticket-alt"></i>
                <span>Acara</span></a></li>
<li class=@yield('violationActive')><a class="nav-link" href="{{action('KesiswaanViolationController@index')}}"><i
                        class="fas fa-exclamation"></i>
                <span>Pelanggaran</span></a></li>
<li class=@yield('reportActive')><a class="nav-link" href="{{action('KesiswaanReportController@index')}}"><i
                        class="fas fa-list"></i>
                <span>Data Pelanggaran</span></a></li>
<li class="menu-header">Data Blog</li>
<li class=@yield('postActive')><a class="nav-link" href="{{action('PostController@index')}}"><i class="fas fa-pen"></i>
                <span>Post</span></a></li>
@endif

{{-- For Kurikulum Admin --}}
@if ($role == 3)
<li class=@yield('todayActive')><a class="nav-link" href="{{action('HomeController@index')}}"><i class="fas fa-pen"></i>
                <span>Today</span></a></li>
<li class="menu-header">Data Pembelajaran</li>
<li class=@yield('roomActive')><a class="nav-link" href="{{action('RoomController@index')}}"><i class="fas fa-key"></i>
                <span>Ruangan</span></a></li>
<li class=@yield('classActive')><a class="nav-link" href="{{action('ClassController@index')}}"><i
                        class="fas fa-key"></i>
                <span>Kelas</span></a></li>
<li class=@yield('subjectActive')><a class="nav-link" href="{{action('SubjectController@index')}}"><i
                        class="fas fa-book"></i>
                <span>Mata Pelajaran</span></a></li>
<li class=@yield('teachingActive')><a class="nav-link" href="{{action('TeachingController@index')}}"><i
                        class="fas fa-book"></i>
                <span>Pengajar</span></a></li>
<li class=@yield('presenceActive')><a class="nav-link" href="{{action('PresenceController@index')}}"><i
                        class="fas fa-user-check"></i>
                <span>Presensi</span></a></li>
<li class=@yield('noteActive')><a class="nav-link" href="{{action('NoteController@index')}}"><i
                        class="fas fa-sticky-note"></i>
                <span>Catatan</span></a></li>
<li class="menu-header">Data Blog</li>
<li class=@yield('postActive')><a class="nav-link" href="{{action('PostController@index')}}"><i class="fas fa-pen"></i>
                <span>Post</span></a></li>
@endif

{{-- For Sarpras Admin --}}
@if ($role == 4)
<li class=@yield('todayActive')><a class="nav-link" href="{{action('HomeController@index')}}"><i class="fas fa-pen"></i>
                <span>Today</span></a></li>
<li class="menu-header">Sarpras</li>
<li class=@yield('inventoryActive')><a class="nav-link" href="{{action('SarprasInventoryController@index')}}"><i
                        class="fas fa-cubes"></i>
                <span>Data Barang</span></a></li>
<li class=@yield('borrowDataActive')><a class="nav-link" href="{{action('SarprasBorrowerController@index')}}"><i
                        class="fas fa-list"></i>
                <span>Data Peminjaman</span></a></li>
<li class="menu-header">Data Blog</li>
<li class=@yield('postActive')><a class="nav-link" href="{{action('PostController@index')}}"><i class="fas fa-pen"></i>
                <span>Post</span></a></li>
@endif

{{-- For Kantin Admin --}}
@if ($role == 5 || $role == 8)
<li class=@yield('todayActive')><a class="nav-link" href="{{action('HomeController@index')}}"><i class="fas fa-pen"></i>
                <span>Today</span></a></li>
<li class="menu-header">Kantin</li>
<li class=@yield('sellerActive')><a class="nav-link" href="{{ action('KantinSellerController@show', Auth::id()) }}"><i
                        class="fas fa-ticket-alt"></i>
                <span>Penjualan</span></a></li>
<li class=@yield('historyActive')><a class="nav-link" href="{{ action('KantinSellerController@index_transaction') }}"><i
                        class="fas fa-ticket-alt"></i>
                <span>Riwayat Penjualan</span></a></li>
<li class=@yield('transferActive')><a class="nav-link" href="{{ action('KantinSellerController@create_transfer') }}"><i
                        class="fas fa-money-bill-wave-alt"></i>
                <span>Transfer Saldo</span></a></li>
@endif

{{-- For Teacher --}}
@if ($role == 6)
<li class=@yield('todayActive')><a class="nav-link" href="{{action('HomeController@index')}}"><i class="fas fa-pen"></i>
                <span>Today</span></a></li>
<li class="menu-header">Data Pembelajaran</li>
<li class=@yield('teachingActive')><a class="nav-link" href="{{action('TeachingController@index')}}"><i
                        class="fas fa-book"></i>
                <span>Jadwal Mengajar</span></a></li>
<li class=@yield('presenceActive')><a class="nav-link" href="{{action('PresenceController@index')}}"><i
                        class="fas fa-user-check"></i>
                <span>Presensi Siswa</span></a></li>
<li class=@yield('noteActive')><a class="nav-link" href="{{action('NoteController@index')}}"><i
                        class="fas fa-sticky-note"></i>
                <span>Catatan</span></a></li>
<li class=@yield('testActive')><a class="nav-link" href="{{route('teacher.index.test')}}"><i class="fas fa-tasks"></i>
                <span>Data Ujian</span></a></li>
<li class=@yield('gradeActive')><a class="nav-link" href="{{route('teacher.index.grade')}}"><i
                        class="fas fa-list-ol"></i>
                <span>Data Nilai</span></a></li>
<li class="menu-header">Kesiswaan</li>
<li class=@yield('reportActive')><a class="nav-link" href="{{action('KesiswaanReportController@index')}}"><i
                        class="fas fa-list"></i>
                <span>Laporan Pelanggaran</span></a></li>
<li class="menu-header">Sarpras</li>
<li class=@yield('inventoryActive')><a class="nav-link" href="{{action('SarprasInventoryController@index')}}"><i
                        class="fas fa-cubes"></i>
                <span>Data Barang</span></a></li>
<li class=@yield('borrowDataActive')><a class="nav-link" href="{{action('SarprasBorrowerController@index')}}"><i
                        class="fas fa-list"></i>
                <span>Data Peminjaman</span></a></li>
@endif

{{-- For Student --}}
@if ($role == 7)
<li class=@yield('todayActive')><a class="nav-link" href="{{action('HomeController@index')}}"><i class="fas fa-pen"></i>
                <span>Today</span></a></li>
<li class=@yield('noteActive')><a class="nav-link" href="{{action('NoteController@index')}}"><i
                        class="fas fa-sticky-note"></i>
                <span>Catatan</span></a></li>

<li class="menu-header">Pembelajaran</li>
<li class=@yield('teachingActive')><a class="nav-link" href="{{action('TeachingController@index')}}"><i
                        class="fas fa-chalkboard-teacher"></i>
                <span>Jadwal Pelajaran</span></a></li>
<li class=@yield('presenceActive')><a class="nav-link" href="{{action('PresenceController@index')}}"><i
                        class="fas fa-user-check"></i>
                <span>Presensi</span></a></li>
<li class=@yield('gradingActive')><a class="nav-link" href="{{action('StudentController@grading')}}"><i
                        class="far fa-list"></i>
                <span>Penilaian</span></a></li>
<li class=@yield('testActive')><a class="nav-link" href="{{action('StudentController@show_testing')}}"><i
                        class="fas fa-tasks"></i>
                <span>Ujian</span></a></li>

<li class="menu-header">Kesiswaan</li>
<li class=@yield('reportActive')><a class="nav-link" href="{{action('StudentController@violation')}}"><i
                        class="fas fa-list"></i>
                <span>Pelanggaran</span></a></li>

<li class="menu-header">Sarpras</li>
<li class=@yield('inventoryActive')><a class="nav-link" href="{{action('SarprasInventoryController@index')}}"><i
                        class="fas fa-cubes"></i>
                <span>Data Barang</span></a></li>
<li class=@yield('borrowDataActive')><a class="nav-link" href="{{action('SarprasBorrowerController@index')}}"><i
                        class="fas fa-list"></i>
                <span>Data Peminjaman</span></a></li>
@endif

@endsection