@extends('layouts.app')

@section('main_content')

    <main class="container max-w-xl mx-auto space-y-8 mt-8 px-2 md:px-0 min-h-screen">

        @include('barta.pages.post.create_post')


            <!-- Barta Card -->
            <livewire:load-more />
            <!-- /Barta Card -->

       

    </main>
@endsection
