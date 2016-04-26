# frozen_string_literal: true
module Browser
  class Platform
    class FirefoxOS < Base
      PLATFORM_NAME = 'Firefox OS'
      def name
        PLATFORM_NAME
      end

      def id
        :firefox_os
      end

      MATCH_REGEX = /Firefox/
      NOT_MATCH_REGEX = /(Android|Linux|BlackBerry|Windows|Mac)/ 
      def match?
        ua !~ NOT_MATCH_REGEX && ua =~ MATCH_REGEX
      end
    end
  end
end
