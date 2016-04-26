# frozen_string_literal: true
module Browser
  class Device
    class Ipad < Base
      def id
        :ipad
      end

      DEVICE_NAME = 'iPad'
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /iPad/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
