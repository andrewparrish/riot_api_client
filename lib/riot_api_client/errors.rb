module RiotApiClient
  module Errors
    class AccountNotFoundError < StandardError; end
    class InvalidClusterError < StandardError; end
    class PuuidDecryptionError < StandardError; end
    class SummonerNotFoundError < StandardError; end
    class ForbiddenError < StandardError; end
  end
end
