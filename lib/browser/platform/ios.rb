# frozen_string_literal: true

module Browser
  class Platform
    class IOS < Base
      MATCHER = /(iPhone|iPad|iPod)/
      VERSION_MATCHER = /OS ([\d.]+)/

      def version
        browser.ua[VERSION_MATCHER, 1] || "0"
      end

      def name
        "iOS (#{device})"
      end

      def id
        :ios
      end

      def match?
        browser.ua =~ MATCHER
      end

      def device
        browser.ua[MATCHER, 1]
      end
    end
  end
end
