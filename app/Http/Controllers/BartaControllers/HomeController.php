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
    public function index()
    {
        // $posts = Post::with('user')
        //     ->withCount('comments')
        //     ->orderBy('created_at', 'desc')
        //     ->get();

        return view('barta.pages.home');
    }

}






