require 'excon'
require 'json'

require 'riot_api_client/accounts'
require 'riot_api_client/matches'
require 'riot_api_client/summoners'
require 'riot_api_client/errors'

module RiotApiClient
  class Client
    include Accounts
    include Matches
    include Summoners

    NA_REGION = 'na1'

    CLUSTERS = %w(americas asia europe sea)

    def initialize(api_key=ENV['RIOT_API_KEY'], base_region=NA_REGION, base_cluster=CLUSTERS[0])
      @api_key = api_key
      @connection = Excon.new(base_url, :persistent => false)
      @base_region = base_region
      raise RiotApiClient::InvalidClusterError unless CLUSTERS.include?(base_cluster)
      @base_cluster = base_cluster
    end

    def get(path, query={})
      request = Excon.get(path, headers: base_headers, query: query)
      resp = JSON.parse(request.body)
      if (resp.is_a?(Hash) && resp.dig('status', 'status_code') && resp['status']['status_code'] == 403)  
        raise RiotApiClient::Errors::ForbiddenError
      end

      resp
    end

    def update_base_region(region)
      @base_region=region
    end

    private

    def base_url(subdomain=nil)
      "https://#{subdomain || @base_cluster}.api.riotgames.com"
    end

    def base_headers 
      {
        'X-Riot-Token' => @api_key
      }
    end

    def cluster_by_region(region)
      {
        'na1' => 'americas',
        'euw1' => 'europe',
        'kr' => 'asia'
      }[region]
    end
  end
end
