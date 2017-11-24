# frozen_string_literal: true

module Browser
  class Platform
    class Mac < Base
      VERSION_REGEX = /Mac OS X\s*([0-9_\.]+)?/
      MATCH_REGEX = /Mac/
      TR_FROM = "_".freeze
      TR_TO = ".".freeze
      NAME = "Macintosh".freeze

      def version
        (browser.ua[VERSION_REGEX, 1] || DEFAULT_VERSION).tr(TR_FROM, TR_TO)
      end

      def name
        NAME
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
