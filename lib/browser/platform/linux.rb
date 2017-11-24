# frozen_string_literal: true

module Browser
  class Platform
    class Linux < Base
      MATCH_REGEX = /Linux/
      NAME = "Generic Linux".freeze

      def version
        DEFAULT_VERSION
      end

      def name
        NAME
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
