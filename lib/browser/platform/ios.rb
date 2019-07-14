# frozen_string_literal: true

module Browser
  class Platform
    class IOS < Base
      MATCHER = /(iPhone|iPad|iPod)/.freeze
      VERSION_MATCHER = /OS ([\d.]+)/.freeze

      def version
        ua[VERSION_MATCHER, 1] || "0"
      end

      def name
        "iOS (#{device})"
      end

      def id
        :ios
      end

      def match?
        ua =~ MATCHER
      end

      def device
        ua[MATCHER, 1]
      end
    end
  end
end
