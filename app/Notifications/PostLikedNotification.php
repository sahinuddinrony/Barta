<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class PostLikedNotification extends Notification
{
    use Queueable;

    /**
     * The post that was liked.
     *
     * @var \App\Models\Post
     */
    public $post;

    /**
     * Create a new notification instance.
     *
     * @param  \App\Models\Post  $post
     * @return void
     */
    public function __construct($post)
    {
        $this->post = $post;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
                    ->line('The introduction to the notification.')
                    ->action('Notification Action', url('/'))
                    ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        // return [
            // 'message' => 'Your post has been liked!',
            // 'message' => $this->post->user->name . ' liked your post!',

            // $userName = $this->post->user->name;
            // $userLastName = $this->post->user->lastname;

            $userName = Auth()->user()->name;
            $userLastName = Auth()->user()->lastname;

            return [
                'message' => $userName . ' ' . $userLastName . ' liked your post!',
                'post_id' => $this->post->id,
            ];
    }



}
