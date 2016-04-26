# frozen_string_literal: true
module Browser
  class Device
    class PlayStation4 < Base
      def id
        :ps4
      end

      DEVICE_NAME = "PlayStation 4"
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /PLAYSTATION 4/i
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
