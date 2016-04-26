# frozen_string_literal: true
module Browser
  class Device
    class KindleFire < Base
      def id
        :kindle_fire
      end

      DEVICE_NAME = "Kindle Fire"
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /Kindle Fire|KFTT/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
