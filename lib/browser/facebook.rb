# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser if Facebook.
    def facebook?(expected_version = nil)
      Facebook.new(ua).match? &&
        detect_version?(full_version, expected_version)
    end
  end

  class Facebook < Base
    VERSION_REGEX = %r[FBAV/([\d.]+)]
    MATCH_REGEX = /FBAV/
    NAME = "Facebook".freeze

    def id
      :facebook
    end

    def name
      NAME
    end

    def full_version
      ua[VERSION_REGEX, 1]
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end

  matchers.unshift(Facebook)
end
