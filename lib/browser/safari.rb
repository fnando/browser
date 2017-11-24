# frozen_string_literal: true

module Browser
  class Base
    WEBKIT_REGEX = /AppleWebKit/i
    WEBKIT_VERSION_REGEX = %r[AppleWebKit/([\d.]+)]

    # Detect if browser is Safari.
    def safari?(expected_version = nil)
      Safari.new(ua).match? && detect_version?(version, expected_version)
    end

    def safari_webapp_mode?
      (device.ipad? || device.iphone?) && ua =~ WEBKIT_REGEX
    end

    # Detect if browser is WebKit-based.
    def webkit?(expected_version = nil)
      ua =~ WEBKIT_REGEX &&
        !edge? &&
        detect_version?(webkit_full_version, expected_version)
    end

    def webkit_full_version
      ua[WEBKIT_VERSION_REGEX, 1] || DEFAULT_FULL_VERSION
    end
  end

  class Safari < Base
    VERSION_REGEX = %r[Version/([\d.]+)]
    SAFARI_REGEX = %r[Safari/([\d.]+)]
    WEBKIT_REGEX = %r[AppleWebKit/([\d.]+)]
    MATCH_SAFARI_REGEX = /Safari/
    MATCH_EXCLUSION_REGEX = /Chrome|CriOS|PhantomJS|FxiOS/
    NAME = "Safari".freeze

    def id
      :safari
    end

    def name
      NAME
    end

    def full_version
      ua[VERSION_REGEX, 1] ||
        ua[SAFARI_REGEX, 1] ||
        ua[WEBKIT_REGEX, 1] ||
        DEFAULT_FULL_VERSION
    end

    def match?
      ua =~ MATCH_SAFARI_REGEX && ua !~ MATCH_EXCLUSION_REGEX
    end
  end
end
