# frozen_string_literal: true

module Browser
  class Platform
    class Other < Base
      NAME = "Other".freeze

      def version
        DEFAULT_VERSION
      end

      def name
        NAME
      end

      def id
        :other
      end

      def match?
        true
      end
    end
  end
end
