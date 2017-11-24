# frozen_string_literal: true

module Browser
  class Platform
    class Android < Base
      MATCH_REGEX = /Android/
      VERSION_REGEX = /Android ([\d.]+)/

      def match?
        browser.ua =~ MATCH_REGEX
      end

      def name
        "Android"
      end

      def id
        :android
      end

      def version
        browser.ua[VERSION_REGEX, 1]
      end
    end
  end
end
