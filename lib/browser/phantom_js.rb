# frozen_string_literal: true
module Browser
  class PhantomJS < Base
    def id
      :phantom_js
    end

    BROWSER_NAME = "PhantomJS"
    def name
      BROWSER_NAME
    end

    VERSION_REGEX = %r[PhantomJS/([\d.]+)]
    def full_version
      ua[VERSION_REGEX, 1] || DEFAULT_VERSION
    end

    MATCH_REGEX = /PhantomJS/
    def match?
      ua =~ MATCH_REGEX
    end
  end
end
