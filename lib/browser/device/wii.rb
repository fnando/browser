# frozen_string_literal: true

module Browser
  class Device
    class Wii < Base
      MATCH_REGEX = /Nintendo Wii/i

      def id
        :wii
      end

      def name
        "Nintendo Wii"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
