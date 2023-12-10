<?php

// namespace App\Http\Controllers\Auth;
namespace App\Http\Controllers\BartaControllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LogoutController extends Controller
{
    public function __invoke()
    {
        auth()->logout();

        return redirect()->route('home');
    }
}
