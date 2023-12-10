<?php

// namespace App\Http\Controllers\Auth;
namespace App\Http\Controllers\BartaControllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Post;
use App\Models\Comment;

class AuthorController extends Controller
{


    public function viewSingleProfile($id)
    {
        // Retrieve a specific user's data
        $userData = User::find($id);

        if (!$userData) {
            // Handle case where user is not found
            return redirect()->route('home')->with('error', 'User not found.');
        }

        // Retrieve the user's posts with comments count
        $userPosts = Post::withCount('comments')
            ->where('user_id', $id)
            ->orderByDesc('created_at')
            ->get();

        // Retrieve the user's comments
        $userComments = Comment::where('user_id', $id)
            ->orderByDesc('created_at')
            ->get();

        return view('barta.pages.profile.view_single_profile', compact('userData', 'userPosts', 'id', 'userComments'));
    }

}
