# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is Chrome.
    def chrome?(expected_version = nil)
      Chrome.new(ua).match? && detect_version?(full_version, expected_version)
    end
  end

  class Chrome < Chromium
    MATCH_EXCLUSION_REGEX = /YaBrowser/
    NAME = "Chrome".freeze

    def id
      :chrome
    end

    def name
      NAME
    end

    def match?
      chromium? && !opera? && !edge? && ua !~ MATCH_EXCLUSION_REGEX
    end
  end
end
