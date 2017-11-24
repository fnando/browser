# frozen_string_literal: true

module Browser
  class Device
    class Xbox360 < Base
      MATCH_REGEX = /Xbox/i

      def id
        :xbox_360
      end

      def name
        "Xbox 360"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
