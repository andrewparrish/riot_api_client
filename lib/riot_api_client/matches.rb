module RiotApiClient
  module Matches
    def fetch_matches_by_puuid(puuid, region, startTime=nil, endTime=nil, limit=20)
      get("#{base_url(region)}/lol/match/v5/matches/by-puuid/#{puuid}/ids") 
    end
  end
end
