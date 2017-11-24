# frozen_string_literal: true

module Browser
  class Device
    class PlayStation3 < Base
      MATCH_REGEX = /PLAYSTATION 3/i

      def id
        :ps3
      end

      def name
        "PlayStation 3"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
