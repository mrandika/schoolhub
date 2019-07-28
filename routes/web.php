<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth/login');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


Route::resource('admin/post', 'PostController');
Route::resource('admin/category', 'CategoryController');
Route::resource('admin/tag', 'TagController');

Route::resource('admin/room', 'RoomController');
Route::resource('admin/subject', 'SubjectController');
Route::resource('admin/presence', 'PresenceController');
Route::resource('admin/note', 'NoteController');
Route::resource('admin/teaching', 'TeachingController');
Route::resource('admin/class', 'ClassController');

Route::resource('admin/session', 'SessionController');

Route::resource('admin/sarpras', 'SarprasController');
Route::resource('admin/kesiswaan', 'KesiswaanController');

Route::resource('teacher', 'TeacherController');
Route::resource('student', 'StudentController');

// Route::resource('admin/sarpras', 'SarprasController');
// Route::resource('admin/kesiswaan', 'KesiswaanController');

/**
 * Sarpras Controller
 */
// Today
Route::get('admin/sarpras/today', 'SarprasController@today')->name('sarpras.today');

// Borrow Data
Route::get('admin/sarpras/data', 'SarprasController@borrowData')->name('sarpras.data');

/**
 * Kesiswaan Controller
 */
// Today
Route::get('admin/kesiswaan/today', 'KesiswaanController@today')->name('kesiswaan.today');

// Index Event
Route::get('admin/kesiswaan/event', 'KesiswaanController@indexEvent')->name('kesiswaan.event');

// Index Violation
Route::get('admin/kesiswaan/violation', 'KesiswaanController@indexViolation')->name('kesiswaan.violation');

// Index Data Violation
Route::get('admin/kesiswaan/violation/data', 'KesiswaanController@violationData')->name('kesiswaan.violation-data');

/**
 * Teacher Controller
 */
// Today
Route::get('teacher/today', 'TeacherController@today')->name('teacher.today');
Route::get('/search','TeacherController@search');

/**
 * Student Controller
 */
// Today
Route::get('student/today', 'StudentController@today')->name('student.today');

/**
 * Admin Controller
 */
// Index
Route::get('admin', 'AdminController@index')->name('admin.index');
Route::get('admin/user', 'AdminController@index')->name('admin.index');

// Create
Route::get('admin/user/create', 'AdminController@createUser')->name('admin.create-user');

// Store
Route::post('admin/create', 'AdminController@saveUser')->name('admin.save-user');

// Show 
Route::get('admin/user/show/{id}', 'AdminController@showUser')->name('admin.show-user');

// Edit 
Route::patch('admin/user/update', 'AdminController@editUser')->name('admin.edit-user');

// Update 
Route::patch('admin/update/user/{id}', 'AdminController@updateUser')->name('admin.update-user');

// Destroy 
Route::delete('admin/delete/user/{id}', 'AdminController@destroyUser')->name('admin.destroy-user');