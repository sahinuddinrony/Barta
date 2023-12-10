<?php

namespace App\Http\Controllers\BartaControllers;

use App\Models\Post;
use App\Models\Comment;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function createPost(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'description' => 'required',
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048', // Add image validation rules
        ]);

        $userId = $request->input('user_id');
        $description = $request->input('description');

        $post = Post::create([
            'user_id' => $userId,
            'uuid' => Str::uuid(),
            'description' => $description,
            'view_count' => 0,
        ]);

        // Handle image upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $post->addMedia($image)
            // ->usingName('Barta Spatia')
            // ->toMediaCollection('barta');
            ->toMediaCollection();
        }

        return redirect()->route('home');
    }

    public function viewSinglePost($postId)
    {
        $post = Post::with(['user', 'comments', 'comments.user'])
            ->where('uuid', $postId)
            ->first();

        if ($post) {
            $post->increment('view_count');

            $commentsCount = $post->comments->count();
            $commentData = $post->comments()
                ->select('comment', 'view_count', 'user_id', 'created_at', 'uuid')
                ->orderByDesc('created_at')
                ->get();

            return view('barta.pages.post.single', compact('post', 'commentsCount', 'commentData'));
        } else {
            return redirect()->route('home')->with('error', 'Post not found.');
        }
    }

    public function editPost($postId)
    {
        $post = Post::where('uuid', $postId)->first();

        if ($post) {
            // Implement authorization logic here if needed

            return view('barta.pages.post.edit', compact('post'));
        } else {
            return redirect()->route('home')->with('error', 'Post not found.');
        }
    }

    public function updatePost(Request $request, $postId)
    {
        $request->validate([
            'description' => 'required',
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:2048', // Adjust the validation rules for the image
        ]);

        $post = Post::where('uuid', $postId)->first();

        if ($post) {
            // Implement authorization logic here if needed

            $post->update(['description' => $request->input('description')]);

           // Handle image update
        if ($request->hasFile('image')) {
            $post->clearMediaCollection(); // Remove existing media

            // Assuming you want to add the image to a media collection named 'images'
            $image = $request->file('image');
            $post->addMedia($image)
                 ->toMediaCollection(); // Add new media

            // dd($post);
        }

            return redirect()->route('home')->with('success', 'Post updated successfully!');
        }
        else {
            return redirect()->route('home')->with('error', 'Post not found.');
        }
    }

    public function deletePost($postId)
    {
        $post = Post::where('uuid', $postId)->first();

        if ($post) {
            // Implement authorization logic here if needed

            // Remove media associated with the post
            $post->clearMediaCollection();

            // Delete the post
            $post->delete();

            return redirect()->route('home')->with('success', 'Post deleted successfully!');
        } else {
            return redirect()->route('home')->with('error', 'Post not found.');
        }
    }


    public function showAllPosts()
    {
        $posts = Post::all();

        return view('posts.home', compact('posts'));
    }
}
