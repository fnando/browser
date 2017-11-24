# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is PhantomJS
    def phantom_js?(expected_version = nil)
      PhantomJS.new(ua).match? &&
        detect_version?(full_version, expected_version)
    end
  end

  class PhantomJS < Base
    VERSION_REGEX = %r[PhantomJS/([\d.]+)]
    MATCH_REGEX = /PhantomJS/
    NAME = "PhantomJS".freeze

    def id
      :phantom_js
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

  matchers.unshift(PhantomJS)
end
