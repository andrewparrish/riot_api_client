module RiotApiClient
  module Matches
    def fetch_matches_by_puuid(puuid, region, start_time=nil, end_time=nil, limit=20)
      resp = get("#{base_url(cluster_by_region(region))}/lol/match/v5/matches/by-puuid/#{puuid}/ids", {
        startTime: start_time,
        endTime: end_time
      }) 
      # An array output of match_ids guarantees that its a succesful response
      return resp if resp.is_a?(Array)

      if (matches_status_code?(resp, 400) && resp.dig('status', 'message').include?("Exception decrypting"))
        raise RiotApiClient::Errors::PuuidDecryptionError
      end

      resp
    end

    def fetch_match_by_match_id(match_id, region)
      get("#{base_url(cluster_by_region(region))}/lol/match/v5/matches/#{match_id}")
    end
  end
end
