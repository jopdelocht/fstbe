<?php

namespace App\Http\Controllers;

use App\Events\sendScore;
use App\Events\SendTask;
use App\Events\JoinGame;
use App\Events\LeaveGame;
use App\Events\DisplayScore;
use Illuminate\Http\Request;

class GameController extends Controller
{
    // create user in pusher array
    public function joinGame(Request $request)
    {
        // Set the score to NULL explicitly
        $score = NULL;
        $displayscore = 0;

        event(new JoinGame(
            $request->input('userid'),
            $request->input('username'),
            $request->input('room'),
            $request->input('role'),
            $score, // Pass NULL as the score
            $displayscore
        ));

        return $request;
    }

    // delete user from pusher array by id, and room
    public function leaveGame(Request $request)
    {
        event(new LeaveGame(
            $request->input('userid'),
            $request->input('room')
        ));
        return $request;
    }

    public function sendScore(Request $request)
    {
        event(new SendScore(
            $request->input('userid'),
            $request->input('score'),
            $request->input('room')
        ));
        return $request;
    }


    public function sendTask(Request $request)
    {
        event(new SendTask(
            $request->input('task'),
            $request->input('room')
        ));
        return $request;
    }

    public function displayScore(Request $request)
    {
        event(new DisplayScore(
            $request->input('room')
        ));
        return $request;
    }
}
