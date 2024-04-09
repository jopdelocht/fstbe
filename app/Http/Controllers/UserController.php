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

    // public function getUserById($id)
    // {
    //     $user = DB::table('users')->where('id', $id)->first();
    //     return response()->json($user);
    // }

    public function updateUserRoleAndGamecode($id, Request $request)
    {
        DB::table('users')->where('id', $id)->update([
            'role' => $request->input('role'),
            'gamecode' => $request->input('gamecode')
        ]);
        return response()->json(['message' => 'User role and gamecode updated successfully'], 200);
    }

    public function removeUserRoleAndGamecode($id)
    {
        DB::table('users')->where('id', $id)->update([
            'role' => NULL,
            'gamecode' => NULL
        ]);
        return response()->json(['message' => 'User role and gamecode removed successfully'], 200);
    }
}
