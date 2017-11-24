# frozen_string_literal: true

module Browser
  class Platform
    class WindowsMobile < Base
      MATCH_REGEX = /Windows CE/
      NAME = "Windows Mobile".freeze

      def version
        DEFAULT_VERSION
      end

      def name
        NAME
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
