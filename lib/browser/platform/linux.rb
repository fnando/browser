# frozen_string_literal: true

module Browser
  class Platform
    class Linux < Base
      MATCH_REGEX = /Linux/

      def version
        "0"
      end

      def name
        "Generic Linux"
      end

      def id
        :linux
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
