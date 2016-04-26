# frozen_string_literal: true
module Browser
  class Nokia < Base
    def id
      :nokia
    end

    BROWSER_NAME = "Nokia S40 Ovi Browser"
    def name
      BROWSER_NAME
    end

    VERSION_REGEX = %r[S40OviBrowser/([\d.]+)]
    def full_version
      ua[VERSION_REGEX, 1] || DEFAULT_VERSION
    end

    MATCH_REGEX = /S40OviBrowser/
    def match?
      ua =~ MATCH_REGEX
    end
  end
end
