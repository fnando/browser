# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is UCBrowser.
    def uc_browser?(expected_version = nil)
      UCBrowser.new(ua).match? &&
        detect_version?(full_version, expected_version)
    end
  end

  class UCBrowser < Base
    VERSION_REGEX = %r[UCBrowser/([\d.]+)]
    MATCH_REGEX = /UCBrowser/
    NAME = "UCBrowser".freeze

    def id
      :uc_browser
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

  matchers.unshift(UCBrowser)
end
