<?php

namespace App\Http\Controllers;

use App\Events\sendScore;
use App\Events\SendTask;
use Illuminate\Http\Request;

class GameController extends Controller
{
    public function SendScore(Request $request)
    {
        event(new SendScore(
            $request->input('userid'),
            $request->input('username'),
            $request->input('score'),
            $request->input('room')
        ));
        return $request;
    }


    public function SendTask(Request $request)
    {
        event(new SendTask(
            $request->input('task'),
            $request->input('room')
        ));
        return $request;
    }
}