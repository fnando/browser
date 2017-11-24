# frozen_string_literal: true

module Browser
  class Device
    class XboxOne < Base
      MATCH_REGEX = /Xbox One/i

      def id
        :xbox_one
      end

      def name
        "Xbox One"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
