module RiotApiClient
  module Summoners
    def fetch_summoner_by_name(summoner_name)
      get("#{base_url}/lol/summoner/v4/summoners/by-name/#{summoner_name}")
    end
  end
end
