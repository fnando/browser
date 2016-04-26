# frozen_string_literal: true
module Browser
  class Device
    class Xbox360 < Base
      def id
        :xbox_360
      end

      DEVICE_NAME = 'Xbox 360'
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /Xbox/i
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
