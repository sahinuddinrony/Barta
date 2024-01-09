<?php

namespace App\Listeners;

use Notification;
use App\Events\CommentCreated;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendEmailCommentCreated;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Notifications\SendNewCommentNotification;

class SendCommentNotification
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(CommentCreated $event): void
    {
        // Access the post model from the event
        $comment = $event->comment;

        // Send notification using the comment model
        Notification::send($comment->post->user, new SendNewCommentNotification($comment));


        // Corrected variable name and usage
        // $firstName = Auth::user()->name;
        // $email = $comment->user->email;

        // // Send Email using the comment model
        // Mail::to($email)->send(new SendEmailCommentCreated($firstName, $comment->user, $comment));

    }
}
