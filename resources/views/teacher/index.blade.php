@extends('layouts.dashboard')

@section('title')
Teacher &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
  <a href="{{action('TeacherController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
  <a href="{{action('TeacherController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('teacherActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
  <section class="section">
    <div class="section-header">
      <h1>Guru</h1>
      <div class="section-header-button">
        <a href="{{ action('TeacherController@create') }}" class="btn btn-primary">Add New</a>
      </div>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
        <div class="breadcrumb-item"><a href="#">Guru</a></div>
      </div>
    </div>
    <div class="section-body">

      <div class="row">
        <div class="col-12">
          <div class="card mb-0">
            <div class="card-body">
              <ul class="nav nav-pills">
                <li class="nav-item">
                  <a class="nav-link active" href="#">All <span class="badge badge-white">{{ $counts }}</span></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div class="float-right">
                <form>
                  <div class="input-group">
                    <input type="text" id="search" class="form-control" placeholder="Search">
                    <div class="input-group-append">
                      <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </form>
              </div>

              <div class="clearfix mb-3"></div>

              <div class="table-responsive">
                <table class="table table-striped">
                  <tbody>
                    <tr>
                      <th>Foto</th>
                      <th>Nama</th>
                      <th>NIP</th>
                    </tr>
                    @foreach ($teachers as $teacher)
                    <tr id="teacher_{{ $teacher->id_user }}">
                      <td>
                        <a href="#">
                          <img alt="image"
                            src="{{url('uploads/userImage/'.\App\User::select('image')->where('id', $teacher->id_user)->first()->image)}}"
                            class="rounded-circle" width="35" data-toggle="title" title="">
                        </a>
                      </td>
                      <td>{{ $teacher->name }}
                        <div class="table-links">
                          <a href="#">View</a>
                          <div class="bullet"></div>
                          <a href="{{ action('TeacherController@edit', $teacher->id_user) }}">Edit</a>
                          <div class="bullet"></div>
                          <a id="deleteTeacher_{{ $teacher->id_user }}" data-id="{{$teacher->id_user}}"
                            href='javascript:void(0)' class="text-danger">Delete</a>
                        </div>
                      </td>
                      <td>
                        {{ $teacher->nip }}
                      </td>
                    </tr>
                    @endforeach
                  </tbody>
                </table>
              </div>
              <div class="float-right">
                <nav>
                  <ul class="pagination">
                    {{ $teachers->links() }}
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
@endsection

@section('scripts')
<script type="text/javascript">
  $('#search').on('keyup', function () {
    $value = $(this).val();
    $.ajax({
      type: 'get',
      url: '{{URL::to('
      search ')}}',
      data: {
        'search': $value
      },
      success: function (data) {
        $('tbody').html(data);
      }
    });
  })
</script>


@foreach ($teachers as $teacher)
<script>
  $(document).ready(function () {
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });

    $('#deleteTeacher_{{ $teacher->id_user }}').on('click', function () {
      var teacherId = $(this).data("id");
      swal({
          title: "Anda yakin?",
          text: "Setelah akun guru ini dihapus, semua data yang terkait akan terhapus!",
          icon: "warning",
          buttons: true,
          dangerMode: true,
        })
        .then((confirm) => {
          if (confirm) {
            $.ajax({
              type: "DELETE",
              url: "{{ url('teacher/')}}" + '/' + teacherId,
              success: function (data) {
                $("#teacher_" + teacherId).remove();
                swal("Sukses!", "Akun guru telah dihapus.", "success");
              },
              error: function (data) {
                swal("Gagal!", "Akun guru gagal dihapus.", "error");
              }
            });
          }
        });
    });
  });
</script>
@endforeach
@endsection