# frozen_string_literal: true
module Browser
  class Platform
    class WindowsMobile < Base
      PLATFORM_NAME = "Windows Mobile"
      def name
        PLATFORM_NAME
      end

      def id
        :windows_mobile
      end

      MATCH_REGEX = /Windows CE/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
