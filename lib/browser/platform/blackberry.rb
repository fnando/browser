# frozen_string_literal: true
module Browser
  class Platform
    class BlackBerry < Base
      MATCH_REGEX = /BB10|BlackBerry/
      def match?
        ua =~ MATCH_REGEX
      end

      PLATFORM_NAME = 'BlackBerry'
      def name
        PLATFORM_NAME
      end

      def id
        :blackberry
      end

      VERSION_REGEX = %r[(?:Version|BlackBerry[\da-z]+)/([\d.]+)]
      def version
        ua[VERSION_REGEX, 1]
      end
    end
  end
end
