# frozen_string_literal: true
module Browser
  class Device
    class WiiU < Base
      def id
        :wiiu
      end

      DEVICE_NAME = "Nintendo WiiU"
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /Nintendo WiiU/i
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
