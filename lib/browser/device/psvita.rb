# frozen_string_literal: true
module Browser
  class Device
    class PSVita < Base
      def id
        :psvita
      end

      DEVICE_NAME = "PlayStation Vita"
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /Playstation Vita/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
