# frozen_string_literal: true
module Browser
  class Platform
    class Windows < Base
      PLATFORM_NAME = 'Windows'
      def name
        PLATFORM_NAME
      end

      def id
        :windows
      end

      MATCH_REGEX = /Windows/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
