<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BartaControllers\HomeController;
use App\Http\Controllers\BartaControllers\PostController;
use App\Http\Controllers\BartaControllers\UserController;
use App\Http\Controllers\BartaControllers\AuthorController;
use App\Http\Controllers\BartaControllers\SearchController;
use App\Http\Controllers\BartaControllers\CommentController;
use App\Http\Controllers\BartaControllers\ProfileController;
use App\Http\Controllers\BartaControllers\Admin\LoginController;
use App\Http\Controllers\BartaControllers\Admin\RegisterController;


Route::get('/', function () {
    return redirect()->route('home');
});

// Route::get('/', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

// Route::get('/dashboard', function () {
//     return view('home');
// })->middleware(['auth', 'verified'])->name('dashboard');


Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
Route::get('/home', [HomeController::class, 'index'])->name('home');

        Route::get('/admin/profile', [RegisterController::class, 'profile'])->name('profile');
        Route::get('/edit-profile', [ProfileController::class, 'index'])->name('edit_profile');
        Route::post('/edit-profile-submit', [ProfileController::class, 'profile_submit'])->name('edit_profile_submit');
        Route::get('/user/profile', [UserController::class, 'userProfile'])->name('user_profile');
        Route::get('/view/{id}/single/profile', [AuthorController::class, 'viewSingleProfile'])->name('view_single_profile');

        Route::post('/search', [SearchController::class, 'search'])->name('search');

        Route::get('/view/{postId}/single/post', [PostController::class, 'viewSinglePost'])->name('view_post');
        Route::post('/posts', [PostController::class, 'createPost'])->name('create_post');
        Route::get('/posts/{postId}/edit', [PostController::class, 'editPost'])->name('edit_post');
        Route::post('/posts/{postId}/update', [PostController::class, 'updatePost'])->name('update_post');
        Route::get('/posts/{postId}/delete', [PostController::class, 'deletePost'])->name('delete_post');


        // Route::get('/comments/{postId}', [CommentController::class, 'viewSingleComment'])->name('view_comment');
        Route::post('/comment/create', [CommentController::class, 'createCommant'])->name('create_comment');
        Route::get('/comments/{commentId}/edit', [CommentController::class, 'editComment'])->name('edit_comment');
        Route::post('/comments/{commentId}/update', [CommentController::class, 'updateComment'])->name('update_comment');
        Route::get('/comments/{commentId}/delete', [CommentController::class, 'deleteComment'])->name('delete_comment');


});

require __DIR__.'/auth.php';

