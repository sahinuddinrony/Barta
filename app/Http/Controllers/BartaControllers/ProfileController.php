<?php

// namespace App\Http\Controllers\Auth;
namespace App\Http\Controllers\BartaControllers;

use Auth;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class ProfileController extends Controller
{

    public function index()
    {

        return view('barta.pages.profile.edit_profile');

        // return view('auth.edit_profile', ['username' => auth()->user()->username]);
    }

    public function profile_submit(Request $request)
    {
        $user = auth()->user();

        $request->validate([
            'name' => 'nullable|string|max:255',
            'lastname' => 'nullable|string|max:255',
            'email' => [
                'nullable',
                'email',
                'max:255',
                Rule::unique('users')->ignore($user->id),
            ],
            'bio' => 'nullable|string',
            'password' => 'nullable|min:8',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Validation for the image
        ]);

        // Update basic user data
        $userData = [
            'name' => $request->input('name'),
            'lastname' => $request->input('lastname'),
            'email' => $request->input('email'),
            'bio' => $request->input('bio'),
        ];

        // Only add password if it is provided
        if ($request->filled('password')) {
            $userData['password'] = Hash::make($request->input('password'));
        }
        // Update user data
        $user->update($userData);

        // dd($request->hasFile('image'));

        // Handle image update
        if ($request->hasFile('image')) {
            // Clear/Remove existing media
            $user->clearMediaCollection();

            // Add new media
            $image = $request->file('image');
            $user->addMedia($image)
            ->toMediaCollection(); // Add new media
        }

        return redirect()->back()->with('success', 'Profile information saved successfully');
    }
}
