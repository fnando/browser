# frozen_string_literal: true
module Browser
  class Device
    class Kindle < Base
      def id
        :kindle
      end

      DEVICE_NAME = 'Kindle'
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /Kindle/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
