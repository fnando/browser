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
    NAME = "Nokia S40 Ovi Browser".freeze

    def id
      :nokia
    end

    def name
      NAME
    end

    def full_version
      ua[VERSION_REGEX, 1] || DEFAULT_FULL_VERSION
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end

  matchers.unshift(Nokia)
end
