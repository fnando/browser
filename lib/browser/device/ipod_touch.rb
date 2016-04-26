# frozen_string_literal: true
module Browser
  class Device
    class IpodTouch < Base
      def id
        :ipod_touch
      end

      DEVICE_NAME = 'iPod Touch'
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /iPod/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
