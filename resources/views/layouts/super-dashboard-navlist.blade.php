@section('dashboardNavigationList')
@php
$role = Auth::user()->role;
@endphp

{{-- For admin --}}
@if ($role == 1)
<li class=@yield('todayActive')><a class="nav-link" href="{{action('AdminController@index')}}"><i
                        class="fas fa-pen"></i>
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
<li class=@yield('presenceActive')><a class="nav-link" href="{{action('PresenceController@index')}}"><i
                        class="fas fa-user-check"></i>
                <span>Presensi</span></a></li>
<li class=@yield('noteActive')><a class="nav-link" href="{{action('NoteController@index')}}"><i
                        class="fas fa-sticky-note"></i>
                <span>Catatan</span></a></li>

<li class="menu-header">Sarpras</li>
<li class=@yield('inventoryActive')><a class="nav-link" href="{{action('SarprasController@index')}}"><i
                        class="fas fa-cubes"></i>
                <span>Data Barang</span></a></li>
<li class=@yield('borrowDataActive')><a class="nav-link" href="{{action('SarprasController@borrowData')}}"><i
                        class="fas fa-list"></i>
                <span>Data Peminjaman</span></a></li>

<li class="menu-header">Kesiswaan</li>
<li class=@yield('eventActive')><a class="nav-link" href="{{action('KesiswaanController@indexEvent')}}"><i
                        class="fas fa-ticket-alt"></i>
                <span>Acara</span></a></li>
<li class=@yield('violationActive')><a class="nav-link" href="{{action('KesiswaanController@indexViolation')}}"><i
                        class="fas fa-exclamation"></i>
                <span>Pelanggaran</span></a></li>
<li class=@yield('violationDataActive')><a class="nav-link" href="{{action('KesiswaanController@violationData')}}"><i
                        class="fas fa-list"></i>
                <span>Data Pelanggaran</span></a></li>

<li class="menu-header">Data Blog</li>
<li class=@yield('postActive')><a class="nav-link" href="{{action('PostController@index')}}"><i class="fas fa-pen"></i>
                <span>Post</span></a></li>
<li class=@yield('categoryActive')><a class="nav-link" href="{{action('CategoryController@index')}}"><i
                        class="fas fa-pen"></i>
                <span>Kategori</span></a></li>
<li class=@yield('tagActive')><a class="nav-link" href="{{action('TagController@index')}}"><i class="fas fa-pen"></i>
                <span>Tag</span></a></li>
@endif

{{-- For Kesiswaan Admin --}}
@if ($role == 2)

@endif

{{-- For Kurikulum Admin --}}
@if ($role == 3)

@endif

{{-- For Sarpras Admin --}}
@if ($role == 4)

@endif

{{-- For Kantin Admin --}}
@if ($role == 5)

@endif

{{-- For Teacher --}}
@if ($role == 6)

@endif

{{-- For Teacher --}}
@if ($role == 7)
<li class=@yield('todayActive')><a class="nav-link" href="{{action('TeacherController@index')}}"><i
                        class="fas fa-pen"></i>
                <span>Today</span></a></li>
<li class=@yield('noteActive')><a class="nav-link" href="{{action('NoteController@index')}}"><i
                        class="fas fa-sticky-note"></i>
                <span>Catatan</span></a></li>

<li class="menu-header">Pembelajaran</li>
<li class=@yield('teachingActive')><a class="nav-link" href="{{action('TeachingController@index')}}"><i
                        class="fas fa-chalkboard-teacher"></i>
                <span>Jadwal Mengajar</span></a></li>
<li class=@yield('presenceActive')><a class="nav-link" href="{{action('PresenceController@index')}}"><i
                        class="fas fa-user-check"></i>
                <span>Presensi Siswa</span></a></li>
<li class=@yield('gradingActive')><a class="nav-link" href="{{action('StudentController@index')}}"><i
                        class="far fa-list"></i>
                <span>Penilaian Siswa</span></a></li>

<li class="menu-header">Kesiswaan</li>
<li class=@yield('reportActive')><a class="nav-link" href="{{action('KesiswaanController@index')}}"><i
                        class="fas fa-key"></i>
                <span>Buat Laporan</span></a></li>

<li class="menu-header">Sarpras</li>
<li class=@yield('inventoryActive')><a class="nav-link" href="{{action('SarprasController@index')}}"><i
                        class="fas fa-cubes"></i>
                <span>Data Barang</span></a></li>
{{-- <li class=""><a class="nav-link" href="{{action('SarprasController@borrowData')}}"><i class="fas fa-list"></i>
<span>Data Peminjaman</span></a></li> --}}
@endif

@endsection