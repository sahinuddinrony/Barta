<?php

namespace App\Livewire;

use App\Models\Post;
use Livewire\Component;
use Livewire\Attributes\On;
use App\Events\ReactProcessed;
use Illuminate\Support\Facades\Auth;
use App\Notifications\PostLikedNotification;

class LikeButton extends Component
{
    public $post;
    public $isLiked;

    public function mount($post)
    {
        $this->post = $post;
        $this->isLiked = $this->post->likes()->where('user_id', auth()->id())->exists();
    }

    // #[On('echo:post-react,ReactProcessed')]
    public function toggleLike()
    {
        if ($this->isLiked) {
            $this->post->likes()->where('user_id', auth()->id())->delete();
        } else {
            $this->post->likes()->create(['user_id' => auth()->id()]);

            event(new ReactProcessed($this->post));

            // Notify the post owner about the like
            $this->post->user->notify(new PostLikedNotification($this->post));
        }

        $this->isLiked = !$this->isLiked;
    }

    public function render()
    {
        return view('livewire.like-button');
    }
}

