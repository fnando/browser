# frozen_string_literal: true

module Browser
  class Device
    class IpodTouch < Base
      MATCH_REGEX = /iPod/

      def id
        :ipod_touch
      end

      def name
        "iPod Touch"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
