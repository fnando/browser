# frozen_string_literal: true
module Browser
  class UCBrowser < Base

    MATCH_REGEX = /UCBrowser/
    VERSION_REGEX = %r[UCBrowser/([\d.]+)]
    BROWSER_NAME = 'UCBrowser'
    def id
      :uc_browser
    end

    def name
      BROWSER_NAME
    end

    def full_version
      ua[VERSION_REGEX, 1] || DEFAULT_VERSION
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
