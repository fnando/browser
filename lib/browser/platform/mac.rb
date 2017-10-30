# frozen_string_literal: true

module Browser
  class Platform
    class Mac < Base
      def version
        (browser.ua[/Mac OS X\s*([0-9_\.]+)?/, 1] || "0").tr("_", ".")
      end

      def name
        "Macintosh"
      end

      def id
        :mac
      end

      def match?
        browser.ua =~ /Mac/
      end
    end
  end
end
