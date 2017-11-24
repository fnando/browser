# frozen_string_literal: true

module Browser
  class Device
    class Iphone < Base
      MATCH_REGEX = /iPhone/

      def id
        :iphone
      end

      def name
        "iPhone"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
