<!-- Search input -->
<form action="{{ route('search')}}" method="POST" class="flex items-center">
    @csrf

    <input type="text" name="query" placeholder="Search..."
        class="border-2 border-gray-300 bg-white h-10 px-5 pr-10 rounded-full text-sm focus:outline-none" />
    {{-- <button type="submit">Search</button> --}}
</form>


 {{-- <!-- Search input -->
 <form action="" method="POST" class="flex items-center">
    <input
            type="text"
            placeholder="Search..."
            class="border-2 border-gray-300 bg-white h-10 px-5 pr-10 rounded-full text-sm focus:outline-none"
    />
  </form>
  <div class="hidden sm:ml-6 sm:flex gap-2 sm:items-center">
    <!-- This Button Should Be Hidden on Mobile Devices -->
        <button
          type="button"
          class="text-gray-900 hover:text-white border-2 border-gray-800 hover:bg-gray-900 focus:ring-2 focus:outline-none focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center hidden md:block">
          Create Post
        </button>

        <!-- /Search input --> --}}


        <!-- resources/views/search/results.blade.php -->

{{-- @foreach($users as $user)
<div>
    <p>Name: {{ $user->name }} {{ $user->lastname }}</p>
    <p>Username: {{ $user->username }}</p>
    <p>Email: {{ $user->email }}</p>
    <!-- Add other user details as needed -->
</div>
@endforeach --}}


