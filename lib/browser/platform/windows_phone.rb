# frozen_string_literal: true
module Browser
  class Platform
    class WindowsPhone < Base
      VERSION_REGEX = /Windows Phone ([\d.]+)/
      def version
        ua[VERSION_REGEX, 1]
      end

      PLATFORM_NAME = "Windows Phone"
      def name
        PLATFORM_NAME
      end

      def id
        :windows_phone
      end

      MATCH_REGEX = /Windows Phone/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
