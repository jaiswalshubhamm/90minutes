<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Carbon\Carbon;
use Illuminate\Support\Facades\Config;

class FootballController extends Controller {
    
    /**
     * 
     * @return type
     */
    public function index() {

        // get live score
        $livescore = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' =>Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/fixtures', [
                    'live' => 'all',
                    'timezone' =>  Config::get('constants.football.timezone'),
                ])->json();
      
        // get leagues
        $leagues = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/leagues',[
                    "current" => "true",
                    'season' => 2021,
                ])->json();
   
       // get next match 
        $nextMatch = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/fixtures', [
                    'next' => 15,
                    'timezone' =>  Config::get('constants.football.timezone'),
                ])->json();
     
        $currentPosition = "Live";
        return view('football.index', compact('leagues', 'livescore', 'currentPosition','nextMatch'));
    }
    /**
     * 
     * @param Request $request
     * @return type
     */
    public function allMatch(Request $request) {
     
        $mytime = Carbon::now();
        $date = $mytime->toDateString();

        if($request->date){
            // get live score
            $livescore = Http::withHeaders([
                        'x-rapidapi-host' => Config::get('constants.football.host'),
                        'x-rapidapi-key' => Config::get('constants.football.key')
                    ])->get('https://v3.football.api-sports.io/fixtures', [
                        'date' => $request->date,
                        'timezone' =>  Config::get('constants.football.timezone'),
                    ])->json();
          
        }else{
            // get live score
            $livescore = Http::withHeaders([
                        'x-rapidapi-host' => Config::get('constants.football.host'),
                        'x-rapidapi-key' => Config::get('constants.football.key')
                    ])->get('https://v3.football.api-sports.io/fixtures', [
                        'date' => $date,
                        'timezone' =>  Config::get('constants.football.timezone'),
                    ])->json();
        } 
      
        // get leagues
        $leagues = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/leagues',[
                    "current" => "true",
                    'season' => date('Y'),
                ])->json();
       
       // get next match 
        $nextMatch = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/fixtures', [
                    'next' => 15,
                    'timezone' => Config::get('constants.football.timezone'),
                ])->json();
     
        $currentPosition = "All";
        return view('football.index', compact('leagues', 'livescore', 'currentPosition','nextMatch'));
    }
    /**
     * 
     * @param type $id
     * @param Request $request
     * @return type
     */
    public function league($id,Request $request) {
        
        // get leguge 
        $leaguge = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/leagues', [
                    'id' => $id
                ])->json();
      // dd($leaguge);
        if($request->year){
            $year = $request->year;
        }else{
            $year = end($leaguge['response'][0]['seasons'])['year'];
        }
        
       
       // get standing 
        $standings = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/standings', [
                    'league' => $id,
                    'season' => $year
                ])->json();
        
        // last match 
        $lastmatch = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/fixtures', [
                    'league' => $id,
                    'season' => $year,
                    'last' => 10,
                    'timezone' =>  Config::get('constants.football.timezone'),
                ])->json();
        
         // top player
        $topplayes = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/players/topscorers', [
                    'league' => $id,
                    'season' => $year,
                ])->json();
        if($topplayes['response'] == null){
            // top player
            $topplayes = Http::withHeaders([
                        'x-rapidapi-host' => Config::get('constants.football.host'),
                        'x-rapidapi-key' => Config::get('constants.football.key')
                    ])->get('https://v3.football.api-sports.io/players/topscorers', [
                        'league' => $id,
                        'season' => $year-1,
                    ])->json();
        }

        return view('football.league', compact('standings','lastmatch','topplayes','leaguge'));
    }
    
    /**
     * 
     * @param type $id
     * @return type
     */
    public function teamDetails($id,Request $request) {
        
        
        // get fixture
        $team = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/teams', [
                    'id' => $id,
                ])->json(); 
       
        // get fixture
        $leagues = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/leagues', [
                    'team' => $id
                ])->json(); 
        
         // last match 
        $lastmatch = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/fixtures', [
                    'team' => $id,
                    'last' => 5,
                    'timezone' =>  Config::get('constants.football.timezone'),
                ])->json();
        
         // next match 
        $nextmatch = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/fixtures', [
                    'team' => $id,
                    'next' => 5,
                    'timezone' =>  Config::get('constants.football.timezone'),
                ])->json();
        
        if($request->leagueid){
            $topPlayerLeagueId = $leagues['response'][$request->leagueid]['league']['id'];
            $topPlayerLeagueYear = end($leagues['response'][$request->leagueid]['seasons'])['year'];
        }else{
            $topPlayerLeagueId = $leagues['response'][0]['league']['id'];
            $topPlayerLeagueYear = end($leagues['response'][0]['seasons'])['year'];
        }
        
         // top player
        $topplayes = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/players/topscorers', [
                    'league' => $topPlayerLeagueId,
                    'season' => $topPlayerLeagueYear,
                ])->json();
        
        
         if($request->leagueid){
             $teamstaticLeagueId = $leagues['response'][$request->leagueid]['league']['id'];
            $teamstaticLeagueYear = end($leagues['response'][$request->leagueid]['seasons'])['year'];
         }else{
             $teamstaticLeagueId = $leagues['response'][0]['league']['id'];
            $teamstaticLeagueYear = end($leagues['response'][0]['seasons'])['year'];
         }
        
         // team statics 
        $teamstatics = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/teams/statistics', [
                    'season' => $teamstaticLeagueYear,
                    'team' => $id,
                    'league' => $teamstaticLeagueId
                ])->json();
        
        $standingLeagueId = $leagues['response'][0]['league']['id'];
        $standingLeagueYear = end($leagues['response'][0]['seasons'])['year'];
        // get standing 
        $standings = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/standings', [
                    'league' => $standingLeagueId,
                    'season' => $standingLeagueYear
                ])->json();
        foreach($standings['response'][0]['league']['standings'] as $standing){
            foreach($standing as $group){
                if($group['team']['id'] == $id){
                    $standingsdata = $standing; 
                    break;
                }
            }
        }
      
        // get transfer
        $transfers = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/transfers', [
                    'team' => $id
                ])->json();
        
         // top player
        $players = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/players', [
                    'team' => $id,
                    'season' => date('Y'),
                ])->json();
        
        if($players['response'] == null){
            // top player
            $players = Http::withHeaders([
                        'x-rapidapi-host' => Config::get('constants.football.host'),
                        'x-rapidapi-key' => Config::get('constants.football.key')
                    ])->get('https://v3.football.api-sports.io/players', [
                        'team' => $id,
                        'season' => date('Y')-1,
                    ])->json();
        }
      
        return view('football.team', compact('transfers','standingsdata','teamstatics','topplayes','nextmatch','lastmatch','leagues','team','players'));
    }
    
    /**
     * 
     * @param type $id
     * @return type
     */
    public function fixtureDetails($id) {
        
        // get fixture
        $fixtures = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/fixtures', [
                    'id' => $id,
                    'timezone' =>  Config::get('constants.football.timezone'),
                ])->json(); 

        // get standing 
        $odds = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/odds', [
                    'fixture' =>$id,
                    'bookmaker' => 8,
                    'bet' =>1,
                ])->json();  
        
        // get standing 
        $standings = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/standings', [
                    'league' => $fixtures['response'][0]['league']['id'],
                    'season' => $fixtures['response'][0]['league']['season']
                ])->json();  
        
        // get h2h
        $h2h = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/fixtures/headtohead', [
                    'h2h' => $fixtures['response'][0]['teams']['home']['id'].'-'.$fixtures['response'][0]['teams']['away']['id'],
                    'timezone' =>  Config::get('constants.football.timezone'),
                ])->json();
        
        // get home last 5 fixture
        $homelastmatch = Http::withHeaders([
                            'x-rapidapi-host' => Config::get('constants.football.host'),
                            'x-rapidapi-key' => Config::get('constants.football.key')
                        ])->get('https://v3.football.api-sports.io/fixtures', [
                            'team' => $fixtures['response'][0]['teams']['home']['id'],
                            'last' => 5,
                            'timezone' =>  Config::get('constants.football.timezone'),
                        ])->json();
        
        // get away last 5 match
        $awaylastmatch = Http::withHeaders([
                            'x-rapidapi-host' => Config::get('constants.football.host'),
                            'x-rapidapi-key' => Config::get('constants.football.key')
                        ])->get('https://v3.football.api-sports.io/fixtures', [
                            'team' => $fixtures['response'][0]['teams']['away']['id'],
                            'last' => 5,
                            'timezone' =>  Config::get('constants.football.timezone'),
                        ])->json();
        
        //position
        $position = array('G'=>'Goalkeeper','D'=>'Defender','M'=>'Midfielder','F'=>'Midfielder');
       
        return view('football.fixturedetails', compact('fixtures','standings','odds','h2h','homelastmatch','awaylastmatch','position'));
    }

    /**
     * 
     * @param type $id
     * @return type
     */
    public function player($id,Request $request) {
        
         if($request->leagueindex){
            $leagueindex = $request->leagueindex;
        }else{
            $leagueindex = 0;
        }
        // get player
        $players = Http::withHeaders([
                            'x-rapidapi-host' => Config::get('constants.football.host'),
                            'x-rapidapi-key' => Config::get('constants.football.key')
                        ])->get('https://v3.football.api-sports.io/players', [
                            'id' =>$id,
                            'season' => date('Y')-1,
                        ])->json();
        //dd($players);
        // get fixture
        $fixtures = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/fixtures', [
                    'team' => $players['response'][0]['statistics'][0]['team']['id'],
                    'last' => 6,
                    'timezone' =>  Config::get('constants.football.timezone'),
                ])->json();
     
         // get transfer
        $transfers = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/transfers', [
                    'player' => $id
                ])->json();
      
         // get trophies
        $trophies = Http::withHeaders([
                    'x-rapidapi-host' => Config::get('constants.football.host'),
                    'x-rapidapi-key' => Config::get('constants.football.key')
                ])->get('https://v3.football.api-sports.io/trophies', [
                    'player' => $id
                ])->json();
      
        return view('football.player', compact('players','fixtures','transfers','trophies','leagueindex'));
    }
}
