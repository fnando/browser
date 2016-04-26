# frozen_string_literal: true
module Browser
  class Safari < Base
    def id
      :safari
    end

    BROWSER_NAME = 'Safari'

    def name
      BROWSER_NAME
    end

    VERSION_REGEX_1 = %r[Version/([\d.]+)]
    VERSION_REGEX_2 = %r[Safari/([\d.]+)]
    VERSION_REGEX_3 = %r[AppleWebKit/([\d.]+)]
    def full_version
      ua[VERSION_REGEX_1, 1] ||
        ua[VERSION_REGEX_2, 1] ||
        ua[VERSION_REGEX_3, 1] ||
        DEFAULT_VERSION
    end

    MATCH_REGEX = /Safari/
    NOT_MATCH_REGEX = /Chrome|CriOS|PhantomJS|FxiOS/
    def match?
      ua =~ MATCH_REGEX && ua !~ NOT_MATCH_REGEX
    end
  end
end
