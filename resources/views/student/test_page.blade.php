@extends('layouts.dashboard')

@section('title')
{{ $question->section_name }} &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('StudentController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('StudentController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('testActive')
active
@endsection

@section('css')
<meta name="token" content="{{ $_GET['token'] }}">
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>{{ $question->section_name }}</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Ujian</a></div>
                <div class="breadcrumb-item"><a href="#">{{ $question->section }} - {{ $question->section_name }}</a>
                </div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-8">
                    @php
                    $index = 1;
                    @endphp
                    <form id="testForm" action="{{ route('student.test.finish', ['token' => $_GET['token']]) }}"
                        method="post">
                        @csrf
                        @foreach ($items as $item)
                        <div class="card" id="soal_{{ $loop->iteration }}">
                            <div class="card-header">
                                <h4>{{ $loop->iteration }}. {{ $item->question }}</h4>
                            </div>
                            <div class="card-body">
                                @foreach (collect(json_decode($item->answer)) as $answerItem)
                                <div class="form-check mb-3">
                                    <input class="form-check-input answer" type="radio"
                                        data-id="{{ $loop->parent->iteration }}" name="jawaban_{{ $index }}" value="
                                    {{ $answerItem->id }}" @if ($saved[$loop->parent->iteration] == $answerItem->id)
                                        checked
                                    @endif>
                                    <label class="form-check-label" for="jawaban_{{ $index }}">
                                        {!! $answerItem->text !!}
                                    </label>
                                </div>
                                @endforeach
                            </div>
                            <div class="card-footer">
                                Soal ini bernilai <b><u>{{ $score }}</u></b> poin.
                                <p class="status-{{ $index }}"></p>
                            </div>
                        </div>
                        @php
                        $index++;
                        @endphp
                        @endforeach
                    </form>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">
                            <h4>Navigasi Soal</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                @foreach ($items as $item)
                                <div class="col-md col-sm">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center"><a
                                                        href="#soal_{{ $loop->iteration }}">{{ $loop->iteration }}</a>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td id="status_{{ $loop->iteration }}" class=""></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="card-footer bg-whitesmoke">
                            <button type="submit" class="btn btn-warning float-right" form="testForm">Selesai</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection

@section('scripts')
<script>
    $(document).ready(function () {

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('.answer').change(function () {
            var id = $(this).data('id');
            var token = $('meta[name="token"]').attr('content');

            $.ajax({
                data: $('#testForm').serialize(),
                url: "{{ route('student.ajax.save.answer') }}?token=" + token,
                type: "POST",
                dataType: 'json',
                success: function (data) {
                    $('.status-' + id).html(
                        '<i class="fas fa-save text-info"></i> Jawaban Disimpan');

                    $('#status_' + id).removeClass('bg-danger');
                    $('#status_' + id).addClass('bg-success');
                },
                error: function (data) {
                    $('.status-' + id).html(
                        '<i class="fas fa-times text-danger"></i> Gagal Disimpan');

                    $('#status_' + id).removeClass('bg-success');
                    $('#status_' + id).addClass('bg-danger');
                }
            });
        })
    });
</script>
@endsection