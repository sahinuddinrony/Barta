<?php

namespace App\Http\Controllers\BartaControllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\Post;
use App\Models\User;
use App\Models\Comment;

class UserController extends Controller {
    public function userProfile() {
        // Get the currently authenticated user
        $user = Auth::user();

        if($user) {
            // Eager load user's posts with user, comments, and comments.user information
            $userPosts = Post::with(['user:id,name,username', 'comments', 'comments.user:id,name,username'])
                ->where('user_id', $user->id)
                ->orderByDesc('created_at')
                ->get();

            // Load user's comments
            $userComments = Comment::where('user_id', $user->id)->get();

            // Pass the data to the view
            return view('barta.pages.profile.profile', compact('user', 'userPosts', 'userComments'));
        } else {
            // Redirect to login if the user is not authenticated
            return redirect()->route('login')->with('error', 'Please log in to view your profile.');
        }
    }

}

