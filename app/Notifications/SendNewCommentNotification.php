<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Auth;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class SendNewCommentNotification extends Notification
{
    use Queueable;

    /**
     * The post that was liked.
     *
     * @var \App\Models\Comment
     */
    public $comment;

    /**
     * Create a new notification instance.
     *
     * @param  \App\Models\Comment  $comment
     * @return void
     */
    public function __construct($comment)
    {
        $this->comment = $comment;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail', 'database'];
        // return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     */
    // public function toMail(object $notifiable): MailMessage
    // {
    //     return (new MailMessage)
    //         ->line('The introduction to the notification.')
    //         ->action('Notification Action', url('/'))
    //         ->line('Thank you for using our application!');
    // }

    public function toMail(object $notifiable): MailMessage
    {
        $url = URL::to('/posts/' . $this->comment->post->uuid);
        $userName = Auth::user()->name;

        return (new MailMessage)
            ->line($userName . ' has left a new comment on your post:')
            ->action('View Comment', $url)
            ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        // $userName = $this->comment->post->user->name;
        // $userLastName = $this->comment->post->user->lastname;
        $userName = Auth()->user()->name;
        $userLastName = Auth()->user()->lastname;

        return [
            'message' => $userName . ' ' . $userLastName . ' commented on your post!',
            'post_id' => $this->comment->post->uuid,
            'username'  => $this->comment->user->username,
            'comment_des' => $this->comment->comment,
        ];
    }
}
