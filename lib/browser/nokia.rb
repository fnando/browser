# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is Nokia S40 Ovi Browser.
    def nokia?(expected_version = nil)
      Nokia.new(ua).match? && detect_version?(full_version, expected_version)
    end
  end

  class Nokia < Base
    VERSION_REGEX = %r[S40OviBrowser/([\d.]+)]
    MATCH_REGEX = /S40OviBrowser/

    def id
      :nokia
    end

    def name
      "Nokia S40 Ovi Browser"
    end

    def full_version
      ua[VERSION_REGEX, 1] || "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end

  matchers.unshift(Nokia)
end
