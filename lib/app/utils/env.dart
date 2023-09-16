class Environment {
  static String api =
      "http://ddragon.leagueoflegends.com/cdn/13.17.1/data/en_US/";
  static String imageApi =
      "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/";
  static String skillsApi =
      "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/";
}
//to get account data profile queryParams
//https://la1.api.riotgames.com/lol/summoner/v4/summoners/by-name/{name}?api_key={apiKey}
//to get all champions masteryData
//https://la1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-puuid/
//{puuid}?api_key={apiKey}
//get singleChampion mastery
//https://la1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-puuid/
//{puuid}/by-champion/{championId-key}?api_key={apiKey}
//get all matchs
//https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/{puuId}/ids?start=0&count=20&api_key={apiKey}
//get rank data
//https://la1.api.riotgames.com/lol/league/v4/entries/by-summoner/jseb5WyaCWK9S9_Qv0dyqMY4FtHX9IZ6Iy4_rW6JA1Owcw?api_key={}
