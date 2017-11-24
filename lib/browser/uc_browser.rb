# frozen_string_literal: true

module Browser
  class UCBrowser < Base
    VERSION_REGEX = %r[UCBrowser/([\d.]+)]
    MATCH_REGEX = /UCBrowser/

    def id
      :uc_browser
    end

    def name
      "UCBrowser"
    end

    def full_version
      ua[VERSION_REGEX, 1] || "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
