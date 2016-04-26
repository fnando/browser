# frozen_string_literal: true
module Browser
  class Platform
    class Linux < Base
      PLATFORM_NAME = "Generic Linux"
      def name
        PLATFORM_NAME
      end

      def id
        :linux
      end

      MATCH_REGEX = /Linux/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
