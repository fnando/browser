# frozen_string_literal: true
module Browser
  class Chrome < Base
    def id
      :chrome
    end

    BROWSER_NAME = 'Chrome'
    def name
      BROWSER_NAME
    end

    VERSION_REGEX_1 = %r[Chrome/([\d.]+)]
    VERSION_REGEX_2 = %r[CriOS/([\d.]+)]
    VERSION_REGEX_3 = %r[Safari/([\d.]+)]
    VERSION_REGEX_4 = %r[AppleWebKit/([\d.]+)]
    def full_version
      # Each regex on its own line to enforce precedence.
      ua[VERSION_REGEX_1, 1] ||
        ua[VERSION_REGEX_2, 1] ||
        ua[VERSION_REGEX_3, 1] ||
        ua[VERSION_REGEX_4, 1] ||
        DEFAULT_VERSION
    end

    MATCH_REGEX = /Chrome|CriOS/
    def match?
      ua =~ MATCH_REGEX && !opera? && !edge?
    end
  end
end
