# frozen_string_literal: true

module Browser
  class Platform
    class FirefoxOS < Base
      MATCH_EXCLUSION_REGEX = /(Android|Linux|BlackBerry|Windows|Mac)/
      MATCH_REGEX = /Firefox/

      def version
        "0"
      end

      def name
        "Firefox OS"
      end

      def id
        :firefox_os
      end

      def match?
        browser.ua !~ MATCH_EXCLUSION_REGEX &&
          browser.ua =~ MATCH_REGEX
      end
    end
  end
end
