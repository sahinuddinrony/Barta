<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Comment Created</title>
    <style>
        @import url('https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css');
    </style>
</head>

<body class="bg-gray-100 p-4">
    <div class="max-w-md mx-auto bg-white p-8 rounded shadow-md">
        <h2 class="text-2xl font-semibold mb-4">New Comment Created</h2>
        {{-- <p class="mb-4">Dear {{ $comment->post->user->name }},<br></p> --}}
        <p class="mb-4">Dear ,<br></p>

        <p>{{ $firstName }} has left a new comment on your post:</p>
        <blockquote class="border-l-4 border-blue-500 pl-4 mb-4">
            {{ $comment->comment }}
        </blockquote>

        <p class="mt-4">Regards,<br>Admin</p>
    </div>

</body>

</html>

{{-- <div class="max-w-md mx-auto bg-white p-8 rounded shadow-md">
    <h2 class="text-2xl font-semibold mb-4">New Comment Created</h2>

    @if ($comment && $comment->post)
        <p class="mb-4">Dear {{ $comment->post->user?->name ?? 'Unknown User' }},<br></p>

        <p>{{ $firstName }} has left a new comment on your post:</p>
        <blockquote class="border-l-4 border-blue-500 pl-4 mb-4">
            {{ $comment->comment }}
        </blockquote>
    @else
        <p>Error: Comment or post data not available.</p>
    @endif

    <p class="mt-4">Regards,<br>Admin</p>
</div> --}}


