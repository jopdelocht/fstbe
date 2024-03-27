<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CardController extends Controller
{
    public function getRegularCards()
    {
        $regularCards = DB::table('regularcards')->get();
        return response()->json($regularCards);
    }
}
