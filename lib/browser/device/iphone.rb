# frozen_string_literal: true
module Browser
  class Device
    class Iphone < Base
      def id
        :iphone
      end

      DEVICE_NAME = 'iPhone'
      def name
        "iPhone"
      end

      MATCH_REGEX = /iPhone/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
