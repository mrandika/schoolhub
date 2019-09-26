@extends('layouts.dashboard')

@section('title')
Violation &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('KesiswaanViolationController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('KesiswaanViolationController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('violationActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Kesiswaan &mdash; Violation</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kesiswaan</a></div>
                <div class="breadcrumb-item"><a href="#">Violation</a></div>
            </div>
        </div>
        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <div class="card mb-0">
                        <div class="card-body">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">All <span
                                            class="badge badge-white">{{ $counts }}</span></a>
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
                            <div class="float-left">
                                <a href="{{ action('KesiswaanViolationController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nama</th>
                                            <th>Score</th>
                                            <th>Action</th>
                                        </tr>
                                        @foreach ($violations->sortByDesc('id') as $violation)
                                        <tr id="violation_{{ $violation->id }}">
                                            <td>
                                                {{ $violation->id }}
                                            </td>
                                            <td>
                                                {{ $violation->name }}
                                            </td>
                                            <td>
                                                {{ $violation->score }}
                                            </td>
                                            <td colspan="2">
                                                <a href="{{ action('KesiswaanViolationController@show', $violation->id) }}"
                                                    class="btn btn-success">Show</a>
                                                <a href="{{ action('KesiswaanViolationController@edit', $violation->id) }}"
                                                    class="btn btn-warning">Edit</a>
                                                <a id="deleteViolation_{{ $violation->id }}"
                                                    data-id="{{$violation->id}}" href='javascript:void(0)'
                                                    class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
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
@foreach ($violations as $violation)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteViolation_{{ $violation->id }}').on('click', function () {
            var violationId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah detail pelanggaran ini dihapus, data yang terkait akan dihapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/kesiswaan/violations')}}" + '/' +
                                violationId,
                            success: function (data) {
                                $("#violation_" + violationId).remove();
                                swal("Sukses!", "Data pelanggaran telah dihapus.",
                                    "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data pelanggaran gagal dihapus.",
                                    "error");
                                console.log(data)
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection