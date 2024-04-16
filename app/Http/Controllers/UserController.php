<?php

namespace App\Http\Controllers;

use App\Events\ResetScore;
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
            'score' => NULL,
            'displayscore' => 0
        ]);
        return response()->json(['message' => 'User role, gamecode and score updated successfully'], 200);
    }

    // database logic when a player leaves a game
    public function removeRoleGameCodeScoreDB($id)
    {
        DB::table('users')->where('id', $id)->update([
            'role' => NULL,
            'gamecode' => NULL,
            'score' => NULL,
            'displayscore' => 0
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

    // database logic to set displayscore to 1 according to gamecode
    public function displayScoreDB($gamecode)
    {
        // Check if there are any users with the given gamecode and a non-null score
        $usersWithScore = DB::table('users')
            ->where('gamecode', $gamecode)
            ->whereNotNull('score') // Add this line to check for non-null scores
            ->exists();

        // If there are users with a non-null score, update their displayscore to 1
        if ($usersWithScore) {
            DB::table('users')
                ->where('gamecode', $gamecode)
                ->whereNotNull('score') // Ensure the condition is applied here as well
                ->update([
                    'displayscore' => 1
                ]);
            DB::table('tasks')
                ->where('gamecode', $gamecode)
                ->update([
                    'displayscore' => 1
                ]);
            return response()->json(['message' => 'All displayscores updated successfully to 1'], 200);
        } else {
            // Handle the case where no users with a non-null score were found
            return response()->json(['message' => 'No users with a non-null score found for the given gamecode'], 404);
        }
    }

    // database logic to set displayscore to 1 according to gamecode
    public function resetScoreDB($gamecode)
    {
        DB::table('users')
            ->where('gamecode', $gamecode)
            ->update([
                'displayscore' => 0,
                'score' => NULL
            ]);
        DB::table('tasks')
            ->where('gamecode', $gamecode)
            ->update([
                'displayscore' => 0
            ]);
        return response()->json(['message' => 'All scores and displayscores reset to 0 or null'], 200);
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
                'score',
                'displayscore'
            )
            ->get();
        return response()->json($users);
    }

    public function createTaskDB(Request $request)
    {
        $tasktitle = $request->tasktitle;
        $taskdescription = $request->taskdescription;
        $gamecode = $request->gamecode;

        $this->resetScoreDB($gamecode);

        // Using insertGetId to get the last inserted ID
        $taskId = DB::table('tasks')->insertGetId([
            'title' => $tasktitle,
            'description' => $taskdescription,
            'gamecode' => $gamecode
        ]);

        return response()->json(['message' => 'task added successfully into database', 'taskId' => $taskId], 201);
    }
}
