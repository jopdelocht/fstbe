<?php

namespace App\Http\Controllers;

use App\Events\CreateTask;
use App\Events\SetScoreToTask;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class TaskController extends Controller
{

    public function getTasksByGamecode($gamecode)
    {
        $tasks = DB::table('tasks')
            ->where('gamecode', $gamecode)
            ->select(
                DB::raw('id as taskid'),
                DB::raw('title as tasktitle'),
                DB::raw('description as taskdescription'),
                'gamecode',
                'averagescore',
                'lowestscore',
                'highestscore',
                'displayscore'
            )
            ->get();
        return response()->json($tasks);
    }

    public function createTask(Request $request)
    {
        $taskid = $request->input('taskid'); // Retrieve the task ID from the request
        $averagescore = NULL;
        $lowestscore = NULL;
        $highestscore = NULL;
        $displayscore = 0;

        event(new CreateTask(
            $request->input('tasktitle'),
            $request->input('taskdescription'),
            $request->input('gamecode'),
            $averagescore,
            $lowestscore,
            $highestscore,
            $taskid, // Include the task ID in the event
            $displayscore
        ));
        return $request;
    }

    //setTaskScoreDB
    public function setTaskScoreDB($id, Request $request)
    {
        DB::table('tasks')->where('id', $id)->update([
            'averagescore' => $request->input('averagescore'),
            'lowestscore' => $request->input('lowestscore'),
            'highestscore' => $request->input('highestscore')
        ]);
        return response()->json(['message' => 'Task score updated successfully'], 200);
    }

    public function setTaskScore(Request $request)
    {
        event(new SetScoreToTask(
            $request->input('taskid'),
            $request->input('averagescore'),
            $request->input('lowestscore'),
            $request->input('highestscore'),
            $request->input('gamecode')
        ));
        return $request;
    }
}
