# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is Firefox.
    def firefox?(expected_version = nil)
      Firefox.new(ua).match? && detect_version?(full_version, expected_version)
    end
  end

  class Firefox < Base
    VERSION_REGEX = %r[(?:Firefox|FxiOS)/([\d.]+)]
    MATCH_REGEX = /Firefox|FxiOS/

    def id
      :firefox
    end

    def name
      "Firefox"
    end

    def full_version
      ua[VERSION_REGEX, 1] || "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
