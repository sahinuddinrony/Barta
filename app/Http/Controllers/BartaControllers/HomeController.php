<?php

// namespace App\Http\Controllers;
namespace App\Http\Controllers\BartaControllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{


    // public function index()
    // {

    //     // Fetch all posts with their authors
    //     $posts = DB::table('posts')
    //         ->join('users', 'posts.user_id', '=', 'users.id')
    //         ->select('posts.*', 'users.name as author_name', 'users.username as single_name')
    //         ->orderBy('created_at', 'desc') // Order by most recent
    //         ->get();



    //     // Fetch comments count for each post
    //     foreach ($posts as $post) {
    //         $commentsCount = DB::table('comments')
    //             ->where('post_id', $post->id)
    //             ->count();

    //         // Attach the comments count to the post object
    //         $post->comments_count = $commentsCount;
    //     }

    //     // Pass the data to the view
    //     return view('barta.pages.home', compact('posts'));
    // }

    public function index()
{
    // Fetch all posts with their authors and comments count
    $posts = Post::with('user') // Assuming the relationship is defined in the Post model
        ->withCount('comments')
        ->orderBy('created_at', 'desc')
        ->get();

    // Pass the data to the view
    return view('barta.pages.home', compact('posts'));
}

}






