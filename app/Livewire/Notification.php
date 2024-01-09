<?php

namespace App\Livewire;

use Livewire\Component;
use Livewire\Attributes\On;

class Notification extends Component
{
    #[On('echo:post-react,ReactProcessed')]
    #[On('echo:update-comment,CommentCreated')]

    public function render()
    {
        $countUnreadNotification = auth()->user()->unreadNotifications()->count();
        $unreadNotification = auth()->user()->unreadNotifications()->limit(5)->get();

        return view('livewire.notification')->with([
            'unreadNotification' => $unreadNotification,
            'countUnreadNotification' => $countUnreadNotification
        ]);
    }
}
