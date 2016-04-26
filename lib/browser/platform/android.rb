# frozen_string_literal: true
module Browser
  class Platform
    class Android < Base
      MATCH_REGEX = /Android/
      def match?
        ua =~ MATCH_REGEX
      end

      PLATFORM_NAME = 'Android'
      def name
        PLATFORM_NAME
      end

      def id
        :android
      end

      VERSION_REGEX = /Android ([\d.]+)/
      def version
        ua[VERSION_REGEX, 1]
      end
    end
  end
end
