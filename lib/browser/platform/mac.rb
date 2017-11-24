# frozen_string_literal: true

module Browser
  class Platform
    class Mac < Base
      VERSION_REGEX = /Mac OS X\s*([0-9_\.]+)?/
      MATCH_REGEX = /Mac/

      def version
        (browser.ua[VERSION_REGEX, 1] || "0").tr("_", ".")
      end

      def name
        "Macintosh"
      end

      def id
        :mac
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
