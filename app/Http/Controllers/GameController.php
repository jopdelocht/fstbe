<?php

namespace App\Http\Controllers;

use App\Events\sendScore;
use App\Events\SendTask;
use App\Events\JoinGame;
use App\Events\LeaveGame;
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

    public function joinGame(Request $request)
    {
        event(new JoinGame(
            $request->input('userid'),
            $request->input('username'),
            $request->input('room')
        ));
        return $request;
    }


    public function leaveGame(Request $request)
    {
        event(new LeaveGame(
            $request->input('userid'),
            $request->input('room')
        ));
        return $request;
    }
}
