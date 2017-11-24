# frozen_string_literal: true

module Browser
  class Device
    class Kindle < Base
      MATCH_REGEX = /Kindle/

      def id
        :kindle
      end

      def name
        "Kindle"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
