# frozen_string_literal: true
module Browser
  class Platform
    class Mac < Base
      PLATFORM_NAME = 'Macintosh'
      def name
        PLATFORM_NAME
      end

      def id
        :mac
      end

      MATCH_REGEX = /Mac/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
