@extends('layouts.app')

@section('edit_comment')
    <main class="container max-w-xl mx-auto space-y-8 mt-8 px-2 md:px-0 min-h-screen">
        <!-- Single post -->
        <section id="newsfeed" class="space-y-6">
            <article class="bg-white border-2 border-black rounded-lg shadow mx-auto max-w-none px-4 py-5 sm:px-6">
                <!-- Barta Card Top -->
                <header>
                    <div class="flex items-center justify-between">
                        <div class="flex items-center space-x-3">


                            <!-- User Info -->
                            <div class="text-gray-900 flex flex-col min-w-0 flex-1">
                                <a href="profile.html" class="hover:underline font-semibold line-clamp-1">
                                    {{ $comment->author_name }}

                                </a>

                                <a href="profile.html" class="hover:underline text-sm text-gray-500 line-clamp-1">
                                    {{ '@' . $comment->single_name }}
                                </a>
                            </div>
                            <!-- /User Info -->
                        </div>

                        <!-- Card Action Dropdown -->
                        <div class="flex flex-shrink-0 self-center" x-data="{ open: false }">
                            <div class="relative inline-block text-left">
                                <div>
                                    <button @click="open = !open" type="button"
                                        class="-m-2 flex items-center rounded-full p-2 text-gray-400 hover:text-gray-600"
                                        id="menu-0-button">
                                        <span class="sr-only">Open options</span>
                                        <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                            <path
                                                d="M10 3a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM10 8.5a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM11.5 15.5a1.5 1.5 0 10-3 0 1.5 1.5 0 003 0z">
                                            </path>
                                        </svg>
                                    </button>
                                </div>
                                <!-- Dropdown menu -->
                                <div x-show="open" @click.away="open = false"
                                    class="absolute right-0 z-10 mt-2 w-48 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
                                    role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button"
                                    tabindex="-1">
                                    <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                                        role="menuitem" tabindex="-1" id="user-menu-item-0">Edit</a>
                                    <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                                        role="menuitem" tabindex="-1" id="user-menu-item-1">Delete</a>
                                </div>
                            </div>
                        </div>
                        <!-- /Card Action Dropdown -->
                    </div>
                </header>




                <!-- Profile Edit Form -->

                <form class="space-y-6" action="{{ route('update_comment', ['commentId' => $comment->uuid]) }}"
                    method="POST">
                    {{-- <form class="space-y-6" action="#" method="POST"> --}}
                    @csrf

                    <div class="space-y-12">
                        <div class="border-b border-gray-900/10 pb-12">
                            <h2 class="text-xl font-semibold leading-7 text-gray-900">
                                Edit Comment
                            </h2>
                            <p class="mt-1 text-sm leading-6 text-gray-600">
                                This information will be displayed publicly so be careful what you
                                share.
                            </p>

                            <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                                <div class="col-span-full">
                                    <label for="comment"
                                        class="block text-sm font-medium leading-6 text-gray-900">Comment</label>
                                    <div class="mt-2">
                                        <textarea id="comment" name="comment" rows="3"
                                            class="block w-full rounded-md border-0 p-2 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-gray-600 sm:text-sm sm:leading-6">{{ $comment->comment }} </textarea>
                                    </div>
                                    <p class="mt-3 text-sm leading-6 text-gray-600">
                                        Write a few sentences about yourself.
                                    </p>
                                </div>
                            </div>

                            <div class="mt-6 flex items-center justify-end gap-x-6">
                                <button type="button" class="text-sm font-semibold leading-6 text-gray-900">
                                    Cancel
                                </button>
                                <button type="submit"
                                    class="rounded-md bg-gray-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-gray-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-600">
                                    Save
                                </button>
                            </div>

                </form>

                <!-- /Profile Edit Form -->

                <!-- Content -->

                <!-- <div class="py-4 text-gray-700 font-normal">
                <p>
                  🎉🥳 Turning 20 today! 🎂
                  <br />
                  One of the best things in my life has been my love affair with
                  <a
                    href="#laravel"
                    class="text-black font-semibold hover:underline"
                    >#Laravel</a
                  >
                  <br />
                  <br />
                  Keep me in your prayers 😌
                </p>

              </div> -->

                {{-- <p><a href="{{ route('home', ['username' => $post->single_name]) }}">Back to Home Feed</a></p> --}}

                <p><a href="{{ route('home') }}">Back to Home Feed</a></p>

                <!-- Date Created & View Stat -->
                <div class="flex items-center gap-2 text-gray-500 text-xs my-2">
                    {{-- <span class="">6 minutes ago</span> --}}
                    {{ \Carbon\Carbon::parse($comment->created_at)->diffForHumans(null, true) }}
                    <span class="">•</span>
                    {{-- <span>450 views</span> --}}
                    <span>Views: {{ $comment->view_count }}</span>
                </div>


            </article>
        </section>
        <!-- /Single post -->
    </main>
@endsection
