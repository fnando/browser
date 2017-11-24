# frozen_string_literal: true

module Browser
  class Safari < Base
    VERSION_REGEX = %r[Version/([\d.]+)]
    SAFARI_REGEX = %r[Safari/([\d.]+)]
    WEBKIT_REGEX = %r[AppleWebKit/([\d.]+)]
    MATCH_SAFARI_REGEX = /Safari/
    MATCH_EXCLUSION_REGEX = /Chrome|CriOS|PhantomJS|FxiOS/

    def id
      :safari
    end

    def name
      "Safari"
    end

    def full_version
      ua[VERSION_REGEX, 1] ||
        ua[SAFARI_REGEX, 1] ||
        ua[WEBKIT_REGEX, 1] ||
        "0.0"
    end

    def match?
      ua =~ MATCH_SAFARI_REGEX && ua !~ MATCH_EXCLUSION_REGEX
    end
  end
end
