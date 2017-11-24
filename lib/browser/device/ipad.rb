# frozen_string_literal: true

module Browser
  class Device
    class Ipad < Base
      MATCH_REGEX = /iPad/

      def id
        :ipad
      end

      def name
        "iPad"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
