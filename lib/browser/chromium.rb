# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is Chromium-based.
    def chromium?(expected_version = nil)
      Chromium.new(ua).match? && detect_version?(full_version, expected_version)
    end
  end

  class Chromium < Base
    CHROME_VERSION_REGEX = %r[Chrome/([\d.]+)]
    CRIOS_VERSION_REGEX = %r[CriOS/([\d.]+)]
    SAFARI_VERSION_REGEX = %r[Safari/([\d.]+)]
    WEBKIT_VERSION_REGEX = %r[AppleWebKit/([\d.]+)]
    MATCH_REGEX = /Chrome|CriOS/

    def id
      :chromium
    end

    def name
      "Chromium"
    end

    def full_version
      # Each regex on its own line to enforce precedence.
      ua[CHROME_VERSION_REGEX, 1] ||
        ua[CRIOS_VERSION_REGEX, 1] ||
        ua[SAFARI_VERSION_REGEX, 1] ||
        ua[WEBKIT_VERSION_REGEX, 1] ||
        "0.0"
    end

    def match?
      ua =~ MATCH_REGEX && !edge?
    end
  end
end
