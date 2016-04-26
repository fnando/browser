# frozen_string_literal: true
module Browser
  class Firefox < Base
    def id
      :firefox
    end

    BROWSER_NAME = 'Firefox'
    def name
      BROWSER_NAME
    end

    VERSION_REGEX = %r[(?:Firefox|FxiOS)/([\d.]+)]
    def full_version
      ua[VERSION_REGEX, 1] || DEFAULT_VERSION
    end

    MATCH_REGEX = /Firefox|FxiOS/
    def match?
      ua =~ MATCH_REGEX
    end
  end
end
