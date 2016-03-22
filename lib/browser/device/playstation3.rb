# frozen_string_literal: true
module Browser
  class Device
    class PlayStation3 < Base
      def id
        :ps3
      end

      DEVICE_NAME = "PlayStation 3"
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /PLAYSTATION 3/i
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
