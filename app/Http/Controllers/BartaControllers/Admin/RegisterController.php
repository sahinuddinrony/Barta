<?php

// namespace App\Http\Controllers\Auth;
namespace App\Http\Controllers\BartaControllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function index()
    {
        return view('barta.pages.admin.register');
    }

    public function profile()
    {
        return view('barta.pages.profile.profile');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|max:255',
            'lastname' => 'required|max:255',
            'username' => 'required|unique:users,username',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:3'
        ]);

        DB::table('users')->insert([
            'name' => $request->name,
            'lastname' => $request->lastname,
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'created_at' => now(),
            'updated_at' => now()
        ]);


        // auth()->attempt($request->only('email', 'password'));

        // if (!auth()->check()) {
        //     // Add some debugging statements or log messages here
        //     dd('Authentication failed');
        // }

        return view('barta.pages.admin.login');


    }


}
