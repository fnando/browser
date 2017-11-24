# frozen_string_literal: true

module Browser
  class Device
    class PlayStation4 < Base
      MATCH_REGEX = /PLAYSTATION 4/i

      def id
        :ps4
      end

      def name
        "PlayStation 4"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
