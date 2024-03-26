<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use App\Models\User;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::get('/users', function () {
  $users = DB::table('users')->get();
  return response()->json($users);
});

//  POST-method for inserting new registered user
Route::post('/users', function (Request $request) {
  $validatedData = $request->validate([
    'name' => 'required|max:255|unique:users',
    'email' => 'required|email|unique:users',
    'password' => 'required',
  ]);
  //   Upon creating a new entry in the user table => insert timestamp
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
// token routes
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
