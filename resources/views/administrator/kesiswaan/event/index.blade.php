@extends('layouts.dashboard')

@section('title')
Events &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('KesiswaanEventController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('KesiswaanEventController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('eventActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Kesiswaan &mdash; Event</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kesiswaan</a></div>
                <div class="breadcrumb-item"><a href="#">Event</a></div>
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
                                <a href="{{ action('KesiswaanEventController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nama</th>
                                            <th>Pelaksanaan</th>
                                        </tr>
                                        @foreach ($events->sortByDesc('id') as $event)
                                        <tr id="event_{{ $event->id }}">
                                            <td>
                                                {{ $event->id }}
                                            </td>
                                            <td>
                                                {{ $event->name }}
                                                <div class="table-links">
                                                    <a
                                                        href="{{ action('KesiswaanEventController@show', $event->id) }}">View</a>
                                                    <div class="bullet"></div>
                                                    <a
                                                        href="{{ action('KesiswaanEventController@edit', $event->id) }}">Edit</a>
                                                    <div class="bullet"></div>
                                                    <a id="deleteEvent_{{ $event->id }}"
                                                        data-id="{{$event->id}}" href='javascript:void(0)'
                                                        class="text-danger">Delete</a>
                                                </div>
                                            </td>
                                            <td>
                                                {{ $event->date }}
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="float-right">
                                <nav>
                                    <ul class="pagination">
                                        {{ $events->links() }}
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
@foreach ($events as $event)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteEvent_{{ $event->id }}').on('click', function () {
            var eventId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah detail acara ini dihapus, data yang terkait akan dihapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/kesiswaan/event')}}" + '/' + eventId,
                            success: function (data) {
                                $("#event_" + eventId).remove();
                                swal("Sukses!", "Data acara telah dihapus.",
                                    "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data acara gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection