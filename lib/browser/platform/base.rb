# frozen_string_literal: true
module Browser
  class Platform
    class Base
      attr_reader :ua

      VERSIONLESS_PLATFORM_IDENTIFIER = '0'

      def initialize(ua)
        @ua = ua
      end

      def match?
        false
      end

      def version
        VERSIONLESS_PLATFORM_IDENTIFIER
      end
    end
  end
end
