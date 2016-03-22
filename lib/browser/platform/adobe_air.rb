# frozen_string_literal: true
module Browser
  class Platform
    class AdobeAir < Base
      MATCH_REGEX = /AdobeAIR/
      def match?
        ua =~ MATCH_REGEX
      end

      VERSION_REGEX = %r[AdobeAIR/([\d.]+)]
      def version
        ua[VERSION_REGEX]
      end

      PLATFORM_NAME = "Adobe AIR"
      def name
        PLATFORM_NAME
      end

      def id
        :adobe_air
      end
    end
  end
end
