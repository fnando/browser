# frozen_string_literal: true
module Browser
  class Device
    class Surface < Base
      def id
        :surface
      end

      DEVICE_NAME = "Microsoft Surface"
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /Touch/
      def match?
        platform.windows_rt? && ua =~ MATCH_REGEX
      end

      private

      def platform
        @platform ||= Platform.new(ua)
      end
    end
  end
end
