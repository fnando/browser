# frozen_string_literal: true
module Browser
  class Device
    class Unknown < Base
      def id
        :unknown
      end

      DEVICE_NAME = 'Unknown'
      def name
        DEVICE_NAME
      end

      def match?
        true
      end
    end
  end
end
