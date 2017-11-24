# frozen_string_literal: true

module Browser
  class Platform
    class Android < Base
      MATCH_REGEX = /Android/
      VERSION_REGEX = /Android ([\d.]+)/
      NAME = "Android".freeze

      def match?
        browser.ua =~ MATCH_REGEX
      end

      def name
        NAME.freeze
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
