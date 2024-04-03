<?php

namespace App\Http\Controllers;

use App\Events\sendScore;
use Illuminate\Http\Request;

class GameController extends Controller
{
    public function SendScore(Request $request)
    {
        event(new SendScore(
            $request->input('username'),
            $request->input('score'),
            $request->input('room')
        ));
        return $request;
    }
}
