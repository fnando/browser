# frozen_string_literal: true

module Browser
  class PhantomJS < Base
    VERSION_REGEX = %r[PhantomJS/([\d.]+)]
    MATCH_REGEX = /PhantomJS/

    def id
      :phantom_js
    end

    def name
      "PhantomJS"
    end

    def full_version
      ua[VERSION_REGEX, 1] || "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
