<?php

namespace App\Http\Controllers\BartaControllers;

use App\Models\Post;
use App\Models\User;
use App\Models\Comment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

// use Illuminate\Http\Request;

class SearchController extends Controller
{

    public function search(Request $request)
    {
        $query = $request->input('query');

        // Search for users based on the query
        $userData = User::where('name', 'like', "%$query%")
            ->orWhere('lastname', 'like', "%$query%")
            ->orWhere('username', 'like', "%$query%")
            ->orWhere('email', 'like', "%$query%")
            ->first();
$id = $userData->id;
            if($userData) {
                // Eager load user's posts with user, comments, and comments.user information
                $userPosts = Post::with(['user:id,name,username', 'comments', 'comments.user:id,name,username'])
                    ->where('user_id', $userData->id)
                    ->orderByDesc('created_at')
                    ->get();

                // Load user's comments
                $userComments = Comment::where('user_id', $userData->id)->get();

                // Pass the data to the view
                return view('barta.pages.profile.view_single_profile', compact('userData', 'userPosts', 'id', 'userComments'));
                // return view('barta.pages.profile.profile', compact('user', 'userPosts', 'userComments'));
            } else {
                // Redirect to login if the user is not authenticated
                return redirect()->route('login')->with('error', 'Please log in to view your profile.');
            }
    }

    //     public function search(Request $request)
//     {
//         $query = $request->input('query');

    //         $users = User::where('name', 'like', "%$query%")
//             ->orWhere('lastname', 'like', "%$query%")
//             ->orWhere('username', 'like', "%$query%")
//             ->orWhere('email', 'like', "%$query%")
//             ->get();

    //         return view('search.results', compact('users'));
//     }


}
