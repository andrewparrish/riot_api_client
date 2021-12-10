require 'excon'
require 'json'

require 'riot_api_client/matches'
require 'riot_api_client/summoners'

module RiotApiClient
  class Client
    include Matches
    include Summoners

    NA_REGION = 'na1'

    def initialize(api_key=ENV['RIOT_API_KEY'], base_region=NA_REGION)
      @api_key = api_key
      @connection = Excon.new(base_url, :persistent => false)
      @base_region = base_region
    end

    def get(path, query={})
      request = Excon.get(path, headers: base_headers, query: query)
      JSON.parse(request.body)
    end

    def update_base_region(region)
      @base_region=region
    end

    private

    def base_url(region=nil)
      "https://#{region || @base_region}.api.riotgames.com"
    end

    def base_headers 
      {
        'X-Riot-Token' => @api_key
      }
    end
  end
end
