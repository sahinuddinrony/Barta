<?php

namespace App\Livewire;

use App\Models\Post;
use App\Models\User;
use Livewire\Component;
use Livewire\WithPagination;

class LoadMore extends Component
{
    use WithPagination;

    public $per_page = 10;
    // public bool $canLoadMore;

    function loadMore()
    {
        // if (!$this->canLoadMore) {

        //     return null;
        // }
        $this->per_page += 10;
    }

    public function render()
    {
        // $posts = Post::latest()->take($this->per_page)->get();

        $posts = Post::with('user')
            ->withCount('comments')
            ->latest()
            ->paginate($this->per_page);
        // $this->canLoadMore = count($posts) >= $this->per_page;

        return view('livewire.load-more', compact('posts'));
    }
}
