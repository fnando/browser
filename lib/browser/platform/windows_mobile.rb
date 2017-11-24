# frozen_string_literal: true

module Browser
  class Platform
    class WindowsMobile < Base
      MATCH_REGEX = /Windows CE/

      def version
        "0"
      end

      def name
        "Windows Mobile"
      end

      def id
        :windows_mobile
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
