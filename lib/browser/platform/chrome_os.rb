# frozen_string_literal: true
module Browser
  class Platform
    class ChromeOS < Base
      MATCH_REGEX = /CrOS/
      def match?
        ua =~ MATCH_REGEX
      end

      PLATFORM_NAME = "Chrome OS"
      def name
        PLATFORM_NAME
      end

      def id
        :chrome_os
      end

      VERSION_REGEX = /CrOS(?: x86_64)? ([\d.]+)/
      def version
        ua[VERSION_REGEX, 1]
      end
    end
  end
end
