module RiotApiClient
  module Errors
    class SummonerNotFoundError < StandardError; end
    class ForbiddenError < StandardError; end
  end
end
