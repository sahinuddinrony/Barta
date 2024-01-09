<?php

namespace App\Livewire;

use App\Models\Post;
use Livewire\Component;
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

    public function toggleLike()
    {
        if ($this->isLiked) {
            $this->post->likes()->where('user_id', auth()->id())->delete();
        } else {
            $this->post->likes()->create(['user_id' => auth()->id()]);

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


// public function markasread($id){
//     if($id){
//         auth()->user()->unreadNotification->where('id',$id)->markasread();
//     }
//     retuen back
// }
