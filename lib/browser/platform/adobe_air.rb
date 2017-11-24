# frozen_string_literal: true

module Browser
  class Platform
    class AdobeAir < Base
      MATCH_REGEX = /AdobeAIR/
      VERSION_REGEX = %r[AdobeAIR/([\d.]+)]

      def match?
        browser.ua =~ MATCH_REGEX
      end

      def version
        browser.ua[VERSION_REGEX, 1]
      end

      def name
        "Adobe AIR"
      end

      def id
        :adobe_air
      end
    end
  end
end
