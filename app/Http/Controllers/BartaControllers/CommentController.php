<?php


namespace App\Http\Controllers\BartaControllers;

use App\Models\Post;
use App\Models\Comment;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CommentController extends Controller
{
    public function createCommant(Request $request)
{
    // Validate request data
    $request->validate([
        'user_id' => 'required|exists:users,id',
        'post_id' => 'required|exists:posts,id',
        'comment' => 'required',
    ]);

    // Assuming you have a form with a user_id & post_id input
    $userId = $request->input('user_id');
    $postId = $request->input('post_id');
    $comment = $request->input('comment');

    // Insert the new comment into the database
    $data = Comment::create([
        'user_id' => $userId,
        'post_id' => $postId,
        'uuid' => Str::uuid(),
        'comment' => $comment,
        'view_count' => 0, // Initialize view count to zero
        'created_at' => now(),
        'updated_at' => now(),
    ]);

    return redirect()->back()->with('success', 'Comment created successfully');
}


    public function viewSingleComment($commentId)
    {
        $comment = Comment::with('user', 'post')
            ->where('uuid', $commentId)
            ->first();

        if ($comment) {
            $comment->increment('view_count');
            return view('barta.pages.post.single', compact('comment'));
        } else {
            return redirect()->route('home')->with('error', 'Comment not found.');
        }
    }

    public function editComment($commentId)
    {
        $comment = Comment::with('user', 'post')
            ->where('uuid', $commentId)
            ->first();

        if ($comment) {
            // Authorization logic can be added here
            return view('barta.pages.comment.edit_comment', compact('comment'));
        } else {
            return redirect()->route('home')->with('error', 'Comment not found.');
        }
    }

    public function updateComment(Request $request, $commentId)
    {
        $request->validate([
            'comment' => 'required',
        ]);

        $comment = Comment::where('uuid', $commentId)->first();

        if ($comment) {
            // Authorization logic can be added here

            $comment->update(['comment' => $request->input('comment')]);

            return redirect()->route('home')->with('success', 'Comment updated successfully!');
        } else {
            return redirect()->route('home')->with('error', 'Comment not found.');
        }
    }

    public function deleteComment($commentId)
    {
        $comment = Comment::where('uuid', $commentId)->first();

        if ($comment) {
            // Authorization logic can be added here

            $comment->delete();

            return redirect()->route('home')->with('success', 'Comment deleted successfully!');
        } else {
            return redirect()->route('home')->with('error', 'Comment not found.');
        }
    }
}
