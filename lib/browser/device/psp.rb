# frozen_string_literal: true
module Browser
  class Device
    class PSP < Base
      def id
        :psp
      end

      DEVICE_NAME = "PlayStation Portable"
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /PlayStation Portable/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
