module RiotApiClient
  module Matches
    def fetch_matches_by_puuid(puuid, region, start_time=nil, end_time=nil, limit=20)
      get("#{base_url(region)}/lol/match/v5/matches/by-puuid/#{puuid}/ids", {
        startTime: start_time,
        endTime: end_time
      }) 
    end

    def fetch_match_by_match_id(match_id, region)
      get("#{base_url(region)}/lol/match/v5/matches/#{match_id}")
    end
  end
end
