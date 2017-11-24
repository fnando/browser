# frozen_string_literal: true

module Browser
  class Device
    class KindleFire < Base
      MATCH_REGEX = /Kindle Fire|KFTT/

      def id
        :kindle_fire
      end

      def name
        "Kindle Fire"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
