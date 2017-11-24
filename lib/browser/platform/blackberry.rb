# frozen_string_literal: true

module Browser
  class Platform
    class BlackBerry < Base
      MATCH_REGEX = /BB10|BlackBerry/
      VERSION_REGEX = %r[(?:Version|BlackBerry[\da-z]+)/([\d.]+)]

      def match?
        browser.ua =~ MATCH_REGEX
      end

      def name
        "BlackBerry"
      end

      def id
        :blackberry
      end

      def version
        browser.ua[VERSION_REGEX, 1]
      end
    end
  end
end
