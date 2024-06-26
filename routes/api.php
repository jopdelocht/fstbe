<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\GameController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\UserController;

// CHAT
Route::post('messages/', [ChatController::class, 'message']);

// // USERS // //

// GET all users
Route::get('/users', [UserController::class, 'getAllUsers']);

// GET-method for retrieving a specific user by userid
Route::get('/users/{id}', function ($id) {
  $result = DB::select("
    SELECT 
    users.`name` AS username,
    users.role AS role,
    users.gamecode AS gamecode,
    games.`name` AS gamename,
    games.setofcard_id AS soc_id,
    sc.name AS socname
  FROM 
    users
  LEFT JOIN 
    games ON users.gamecode COLLATE utf8mb4_unicode_ci = games.gamecode COLLATE utf8mb4_unicode_ci
  LEFT JOIN 
    setofcards sc ON games.setofcard_id = sc.id
  WHERE 
    users.id = ?;
  ", [$id]);

  // Check if the result is not empty
  if (!empty($result)) {
    return response()->json($result[0], 200); // Return the first (and only) record
  } else {
    return response()->json(['message' => 'User not found'], 404); // Return a 404 if no game is found
  }
});

// UPDATE users gamecode, role, score (and displayscore)
Route::patch('joingameupdatedatabase/{id}', [UserController::class, 'setRoleGameCodeScoreDB']);
Route::patch('joingameupdatepusher', [GameController::class, 'joinGame']);

// REMOVE users gamecode and role
Route::patch('leavegameupdatedatabase/{id}', [UserController::class, 'removeRoleGameCodeScoreDB']);
Route::patch('leavegameupdatepusher', [GameController::class, 'leaveGame']);

// UPDATE users score
Route::patch('setscoreupdatedatabase/{id}', [UserController::class, 'sendScoreDB']);
Route::patch('setscoreupdatepusher', [GameController::class, 'sendScore']);

// DISPLAY SCORE
Route::patch('displayscoreupdatedatabase/{gamecode}', [UserController::class, 'displayScoreDB']);
Route::patch('displayscoreupdatepusher', [GameController::class, 'displayScore']);

// RESET SCORE
Route::patch('resetscoreupdatedatabase/{gamecode}', [UserController::class, 'resetScoreDB']);
Route::patch('resetscoreupdatpusher', [GameController::class, 'resetScore']);


// TASKS
// GET all tasks
Route::get('tasks-by-gamecode/{gamecode}', [TaskController::class, 'getTasksByGamecode']);

// TASKS (Create a NEW task v2)
// (database)
Route::middleware('auth:sanctum')->group(function () {
  Route::post('createtaskupdatedatabase', [UserController::class, 'createTaskDB']);
});
// (pusher)
Route::post('createtaskupdatepusher', [TaskController::class, 'createTask']);

// Update task's scores
// (database)
Route::patch('settaskscoreupdatedatabase/{id}', [TaskController::class, 'setTaskScoreDB']);
// (pusher)
Route::patch('settaskscoreupdatepusher', [TaskController::class, 'setTaskScore']);


// JOINED PLAYERS ARRAY //

// NgOnInit (GET)
// GET users by gamecode
Route::get('/users-by-gamecode/{gamecode}', [UserController::class, 'getUsersByGamecode']);


// REGISTER USER
// POST-method for inserting new registered user
Route::post('/users', function (Request $request) {
  $validatedData = $request->validate([
    'name' => 'required|max:255|unique:users',
    'email' => 'required|email|unique:users',
    'password' => 'required',
  ]);
  // Upon creating a new entry in the user table => insert timestamp
  $user = User::create([
    'name' => $validatedData['name'],
    'email' => $validatedData['email'],
    'password' => $validatedData['password'],
    'created_at' => now(),
    'updated_at' => now(),
  ]);
  // Ensure the User model is using the HasApiTokens trait
  $token = $user->createToken('auth_token')->plainTextToken;
  // Update the remember_token in the database with the new token
  DB::table('users')
    ->where('id', $user->id)
    ->update(['remember_token' => $token]);
  // Display message and return json for $token
  return response()->json(['id' => $user->id, 'token' => $token], 201);
});

// Token routes
Route::post('/tokens/create', function (Request $request) {
  $userId = $request->user()->id;
  $user = User::find($userId);

  if ($user) {
    $token = $user->createToken('mynewtoken');
    // Update the user's remember_token in the database
    $user->update(['remember_token' => $token->plainTextToken]);

    // Return the token
    return ['token' => $token->plainTextToken];
  }

  // Handle the case where the user is not found
  return response()->json(['error' => 'User not found'], 404);
});



// // GAMES // //

// GET-method for retrieving all games
Route::get('/games', function (Request $request) {
  $result = DB::select("
  SELECT 
  games.id,
  games.`name` AS gamename,
  games.setofcard_id,
  setofcards.name AS setofcardname,
  games.gamecode
  FROM games
  LEFT JOIN setofcards 
  ON setofcards.id = games.setofcard_id
");
  return response()->json($result, 200);
});

// GET-method for retrieving a specific game by gamecode 
Route::get('/games/{gamecode}', function ($gamecode) {
  $result = DB::select("
  SELECT 
  games.id,
  games.`name` AS gamename,
  games.setofcard_id,
  setofcards.name AS setofcardname,
  games.gamecode
  FROM games
  LEFT JOIN setofcards 
  ON setofcards.id = games.setofcard_id
  WHERE games.gamecode = ?
  ", [$gamecode]);

  // Check if the result is not empty
  if (!empty($result)) {
    return response()->json($result[0], 200); // Return the first (and only) record
  } else {
    return response()->json(['message' => 'Game not found'], 404); // Return a 404 if no game is found
  }
});

// POST-method for inserting a new game
Route::middleware('auth:sanctum')->post('/games', function (Request $request) {
  $name = $request->name;
  $setofcard_id = $request->setofcard_id;
  $gamecode = $request->gamecode;

  DB::insert('INSERT INTO games (name, setofcard_id, gamecode) VALUES (?, ?, ?)', [$name, $setofcard_id, $gamecode]);
  return response()->json(['message' => 'added successfully'], 201);
});





// SELECT 
//     users.`name` AS username,
//     users.role AS role,
//     users.gamecode AS gamecode,
//     games.`name` AS gamename,
//     games.setofcard_id AS soc_id,
//     sc.name AS socname
// FROM 
//     users
// JOIN 
//     games ON users.gamecode COLLATE utf8mb4_unicode_ci = games.gamecode COLLATE utf8mb4_unicode_ci
// JOIN 
//     setofcards sc ON games.setofcard_id = sc.id;
