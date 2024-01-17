require 'riot_api_client/errors'

module RiotApiClient
  module Accounts
    def fetch_account_by_name_and_tag(game_name, tag)
      resp = get("#{base_url}/riot/account/v1/accounts/by-riot-id/#{game_name}/#{tag}")
      if (resp.dig('status', 'status_code') && resp['status']['status_code'] == 404) 
        raise RiotApiClient::Errors::AccountNotFoundError
      end

      resp
    end
  end
end
