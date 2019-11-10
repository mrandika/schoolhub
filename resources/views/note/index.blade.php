@extends('layouts.dashboard')

@section('title')
Note &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('NoteController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('NoteController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('noteActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Catatan</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Catatan</a></div>
            </div>
        </div>
        <div class="section-body">
            <div class="card mb-4">
                <div class="card-body">
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">All <span
                                    class="badge badge-white">{{ $counts }}</span></a>
                        </li>
                    </ul>
                </div>
                @if (Auth::user()->role != 7)
                <div class="float-left p-4">
                    <a href="{{ action('NoteController@create') }}" class="btn btn-primary"><i class="fas fa-plus"></i>
                        Add</a>
                </div>
                @endif
            </div>
            <div class="row">
                @foreach ($notes->sortByDesc('id') as $note)
                <div class="col-md-3">
                    <div id="note_{{ $note->id }}" class="card">
                        <div class="card-header">
                            <h4 class="card-title">
                                {{ \App\UserData::select('name')->where('id_user', $note->id_teacher)->first()->name }},
                            </h4>
                            <p class="card-text">Untuk:
                                {{ \App\StudentClass::select('name')->where('id', $note->id_class)->first()->name }}</p>
                        </div>
                        <div class="card-body">
                            <p class="card-text">{{ $note->text }}</p>
                            @if (Auth::user()->role != 7)
                            <a href="{{ action('NoteController@edit', $note->id) }}"
                                class="card-link text-warning">Edit</a>
                            <a id="deleteNote_{{ $note->id }}" data-id="{{ $note->id }}"
                                class="card-link text-danger"><i class="fas fa-minus-circle"></i> Delete</a>
                            @endif
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            <div class="float-right">
                <nav>
                    <ul class="pagination">
                        {{ $notes->links() }}
                    </ul>
                </nav>
            </div>
        </div>
    </section>
</div>
@endsection

@section('scripts')
@foreach ($notes->sortBy('id') as $note)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteNote_{{ $note->id }}').on('click', function () {
            var noteId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah catatan ini dihapus, kelas terkait tidak akan bisa melihat catatan ini lagi!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/note')}}" + '/' + noteId,
                            success: function (data) {
                                $("#note_" + noteId).remove();
                                swal("Sukses!", "Catatan telah dihapus.",
                                    "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Catatan gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection