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

Route::get('/blog', function() {
    $post = \App\BlogPost::all();
    $categories = \App\BlogCategory::all();
    return view('blog/home')
    ->withCategories($categories)
    ->withPosts($post);
})->name('home');


Route::resource('dashboard/blog/posts', 'PostController');
Route::resource('dashboard/blog/categories', 'CategoryController');
Route::resource('dashboard/blog/tags', 'TagController');

Route::resource('dashboard/room', 'RoomController');
Route::resource('dashboard/subject', 'SubjectController');
Route::resource('dashboard/presence', 'PresenceController');
Route::resource('dashboard/note', 'NoteController');
Route::resource('dashboard/teaching', 'TeachingController');
Route::resource('dashboard/class', 'ClassController');

Route::resource('dashboard/session', 'SessionController');

Route::resource('dashboard/sarpras/inventory', 'SarprasInventoryController');
Route::resource('dashboard/sarpras/borrower', 'SarprasBorrowerController');

Route::resource('dashboard/kesiswaan/events', 'KesiswaanEventController');
Route::resource('dashboard/kesiswaan/violations', 'KesiswaanViolationController');
Route::resource('dashboard/kesiswaan/reports', 'KesiswaanReportController');

Route::resource('dashboard/kantin/seller', 'KantinSellerController');
Route::resource('dashboard/kantin/shop', 'KantinShopController');
Route::resource('dashboard/kantin/inventory', 'KantinInventoryController');

Route::resource('dashboard/teacher', 'TeacherController');
Route::resource('dashboard/student', 'StudentController');

// Route::resource('admin/sarpras', 'SarprasController');
// Route::resource('admin/kesiswaan', 'KesiswaanController');

/**
 * Presence Controller
 */
// Generate QR
Route::get('dashboard/presence/data/create', array(
    'as' => 'presence.createdata', 
    'uses' => 'PresenceController@createdata'
), function () {
    return redirect()->action('PresenceController@createdata');
});

// Create QR
Route::post('dashboard/presence/data', array(
    'as' => 'presence.storedata', 
    'uses' => 'PresenceController@storedata'
), function () {
    return redirect()->action('PresenceController@storedata');
});

// Show QR
Route::get('dashboard/presence/data/{presence}', array(
    'as' => 'presence.showdata', 
    'uses' => 'PresenceController@showdata'
), function ($id) {
    return redirect()->action('PresenceController@showdata');
});

/**
 * Kesiswaan Report Controller
 */
// Reporting
Route::get('dashboard/presence/reports/exports', array(
    'as' => 'reports.export', 
    'uses' => 'KesiswaanReportController@export_excel'
), function () {
    return redirect()->action('KesiswaanReportController@export_excel');
});

/**
 * Teacher Controller
 */
// Today
Route::get('dashboard/teacher/today', 'TeacherController@today')->name('teacher.today');
Route::get('/search','TeacherController@search');
Route::get('dashboard/test/teacher','TeacherController@index_test')->name('teacher.index.test');
Route::get('dashboard/test/teacher/create','TeacherController@create_test')->name('teacher.create.test');
Route::post('dashboard/test/teacher/save','TeacherController@store_test')->name('teacher.store.test');

/**
 * Student Controller
 */
// Today
Route::get('dashboard/today', 'StudentController@today')->name('student.today');
Route::get('dashboard/grading', 'StudentController@grading')->name('student.grading');
Route::get('dashboard/violation', 'StudentController@violation')->name('student.violation');
Route::get('dashboard/test', 'StudentController@show_testing')->name('student.show.testing');
Route::post('dashboard/test/validate', 'StudentController@validate_token')->name('student.validate.token');
Route::get('dashboard/test/attempt', 'StudentController@start_test')->name('student.test');
Route::post('dashboard/test/save', 'StudentController@save_progress')->name('student.ajax.save.answer');
Route::post('dashboard/test/finish', 'StudentController@finish_test')->name('student.test.finish');

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