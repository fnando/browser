# frozen_string_literal: true

module Browser
  class Device
    class TV < Base
      MATCH_REGEX = /(tv|Android.*?ADT-1|Nexus Player)/i

      def id
        :tv
      end

      def name
        "TV"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
