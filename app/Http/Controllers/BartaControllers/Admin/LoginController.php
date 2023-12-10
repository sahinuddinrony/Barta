<?php

// namespace App\Http\Controllers\Auth;
namespace App\Http\Controllers\BartaControllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function index()
    {
        return view('barta.pages.admin.login');
    }



    public function login_submit(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);


        $credential = [
            'email' => $request->email,
            'password' => $request->password
        ];

        if(auth()->attempt($credential)) {

            return redirect()->route('home');

            // return redirect()->route('home', ['username' => auth()->user()->username]);

            // return redirect()->route('home', ['username' => auth()->user()->username]);

        } else {
             return redirect()->route('login')->with('error', 'Information is not correct');
        }
    }

    Public function logout()
    {
        auth()->logout();
        return redirect()->route('login');
    }



}
