# frozen_string_literal: true

module Browser
  class Platform
    class ChromeOS < Base
      MATCH_REGEX = /CrOS/
      VERSION_REGEX = /CrOS(?: x86_64)? ([\d.]+)/
      NAME = "Chrome OS".freeze

      def match?
        browser.ua =~ MATCH_REGEX
      end

      def name
        NAME
      end

      def id
        :chrome_os
      end

      def version
        browser.ua[VERSION_REGEX, 1]
      end
    end
  end
end
