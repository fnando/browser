# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is Chrome.
    def chrome?(expected_version = nil)
      Chrome.new(ua).match? && detect_version?(full_version, expected_version)
    end
  end

  class Chrome < Base
    CHROME_REGEX = %r[Chrome/([\d.]+)]
    CRIOS_REGEX = %r[CriOS/([\d.]+)]
    SAFARI_REGEX = %r[Safari/([\d.]+)]
    WEBKIT_REGEX = %r[AppleWebKit/([\d.]+)]
    MATCH_REGEX = /Chrome|CriOS/

    def id
      :chrome
    end

    def name
      "Chrome"
    end

    def full_version
      # Each regex on its own line to enforce precedence.
      ua[CHROME_REGEX, 1] ||
        ua[CRIOS_REGEX, 1] ||
        ua[SAFARI_REGEX, 1] ||
        ua[WEBKIT_REGEX, 1] ||
        "0.0"
    end

    def match?
      ua =~ MATCH_REGEX && !opera? && !edge?
    end
  end
end
