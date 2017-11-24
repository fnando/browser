# frozen_string_literal: true

module Browser
  class Platform
    class IOS < Base
      MATCH_REGEX = /(iPhone|iPad|iPod)/
      VERSION_REGEX = /OS ([\d.]+)/

      def version
        browser.ua[VERSION_REGEX, 1] || DEFAULT_VERSION
      end

      def name
        "iOS (#{device})"
      end

      def id
        :ios
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end

      def device
        browser.ua[MATCH_REGEX, 1]
      end
    end
  end
end
