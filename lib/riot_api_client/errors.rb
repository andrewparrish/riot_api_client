module RiotApiClient
  module Errors
    class AccountNotFoundError < StandardError; end
    class SummonerNotFoundError < StandardError; end
    class ForbiddenError < StandardError; end
  end
end
