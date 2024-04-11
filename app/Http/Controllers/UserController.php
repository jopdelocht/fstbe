<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function getAllUsers()
    {
        $users = DB::table('users')->get();
        return response()->json($users);
    }

    // database logic when a player joins a NEW game
    public function setRoleGameCodeScoreDB($id, Request $request)
    {
        DB::table('users')->where('id', $id)->update([
            'role' => $request->input('role'),
            'gamecode' => $request->input('gamecode'),
            'score' => NULL
        ]);
        return response()->json(['message' => 'User role, gamecode and score updated successfully'], 200);
    }

    // database logic when a player leaves a game
    public function removeRoleGameCodeScoreDB($id)
    {
        DB::table('users')->where('id', $id)->update([
            'role' => NULL,
            'gamecode' => NULL,
            'score' => NULL
        ]);
        return response()->json(['message' => 'User role, gamecode and score removed successfully'], 200);
    }

    // database logic when a player sets a new score
    public function sendScoreDB($id, Request $request)
    {
        DB::table('users')->where('id', $id)->update([
            'score' => $request->input('score')
        ]);
        return response()->json(['message' => 'User score updated successfully'], 200);
    }

    public function getUsersByGamecode($gamecode)
    {
        $users = DB::table('users')
            ->where('gamecode', $gamecode)
            ->select(
                DB::raw('id as userid'),
                DB::raw('name as username'),
                'gamecode',
                'role',
                'score'
            )
            ->get();
        return response()->json($users);
    }
}
