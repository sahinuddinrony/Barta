{{-- <div>

    <button x-data="{
        liked: {{ $isLiked ? 'true' : 'false' }},
        handle() {
            this.liked = !this.liked;
            Livewire.emit('toggleLike');
        }
    }" x-on:click="handle"
        :class="{ 'text-red-600': liked, 'text-gray-600': !liked }" wire:loading.attr="disabled"
        class="-m-2 flex gap-2 text-xs items-center rounded-full p-2 hover:text-gray-800">
        <span class="sr-only">Like</span>
        <!-- Show this icon when liked -->
        <svg x-show="liked" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-5 h-5">
            <path
                d="M11.645 20.91l-.007-.003-.022-.012a15.247 15.247 0 01-.383-.218 25.18 25.18 0 01-4.244-3.17C4.688 15.36 2.25 12.174 2.25 8.25 2.25 5.322 4.714 3 7.688 3A5.5 5.5 0 0112 5.052 5.5 5.5 0 0116.313 3c2.973 0 5.437 2.322 5.437 5.25 0 3.925-2.438 7.111-4.739 9.256a25.175 25.175 0 01-4.244 3.17 15.247 15.247 0 01-.383.219l-.022.012-.007.004-.003.001a.752.752 0 01-.704 0l-.003-.001z" />
        </svg>
        <!-- Show this icon when not liked -->
        <svg x-show="!liked" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
            stroke-width="2" class="w-5 h-5">
            <path stroke-linecap="round" stroke-linejoin="round"
                d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
        </svg>
        <p>{{ $post->likes()->count() }}</p>
    </button>

</div> --}}

<div>
    <button x-data="{ liked: {{ $isLiked ? 'true' : 'false' }} }"
        x-on:click="liked = !liked; $wire.toggleLike()"
        :class="{ 'text-red-600': liked, 'text-gray-600': !liked }"
        wire:loading.attr="disabled"
        class="-m-2 flex gap-2 text-xs items-center rounded-full p-2 hover:text-gray-800">
    <span class="sr-only">Like</span>
    <!-- Show this icon when liked -->
    <svg x-show="liked" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-5 h-5">
        <path d="M11.645 20.91l-.007-.003-.022-.012a15.247 15.247 0 01-.383-.218 25.18 25.18 0 01-4.244-3.17C4.688 15.36 2.25 12.174 2.25 8.25 2.25 5.322 4.714 3 7.688 3A5.5 5.5 0 0112 5.052 5.5 5.5 0 0116.313 3c2.973 0 5.437 2.322 5.437 5.25 0 3.925-2.438 7.111-4.739 9.256a25.175 25.175 0 01-4.244 3.17 15.247 15.247 0 01-.383.219l-.022.012-.007.004-.003.001a.752.752 0 01-.704 0l-.003-.001z" />
    </svg>
    <!-- Show this icon when not liked -->
    <svg x-show="!liked" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
         stroke-width="2" class="w-5 h-5">
        <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
    </svg>
    <p>{{ $post->likes()->count() }}</p>
   </button>

</div>
