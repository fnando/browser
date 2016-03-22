# frozen_string_literal: true
module Browser
  class Platform
    class Other < Base
      PLATFORM_NAME = 'Other'
      def name
        PLATFORM_NAME
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
