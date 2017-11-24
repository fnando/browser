# frozen_string_literal: true

module Browser
  class Device
    class WiiU < Base
      MATCH_REGEX = /Nintendo WiiU/i

      def id
        :wiiu
      end

      def name
        "Nintendo WiiU"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
