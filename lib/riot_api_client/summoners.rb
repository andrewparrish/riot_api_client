require 'riot_api_client/errors'

module RiotApiClient
  module Summoners
    def fetch_summoner_by_name(summoner_name)
      resp = get("#{base_url}/lol/summoner/v4/summoners/by-name/#{summoner_name}")
      if (resp.dig('status', 'status_code') && resp['status']['status_code'] == 404) 
        raise RiotApiClient::Errors::SummonerNotFoundError
      end

      resp
    end
  end
end
