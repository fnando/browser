# frozen_string_literal: true

module Browser
  class Platform
    class WindowsPhone < Base
      MATCH_REGEX = /Windows Phone/
      VERSION_REGEX = /Windows Phone ([\d.]+)/

      def version
        browser.ua[VERSION_REGEX, 1]
      end

      def name
        "Windows Phone"
      end

      def id
        :windows_phone
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
