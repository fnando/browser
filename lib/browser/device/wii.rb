# frozen_string_literal: true
module Browser
  class Device
    class Wii < Base
      def id
        :wii
      end

      DEVICE_NAME = "Nintendo Wii"
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /Nintendo Wii/i
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
