# frozen_string_literal: true
module Browser
  class Device
    class XboxOne < Base
      def id
        :xbox_one
      end

      DEVICE_NAME = "Xbox One" 
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /Xbox One/i
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
