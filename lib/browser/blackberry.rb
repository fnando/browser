# frozen_string_literal: true

module Browser
  class BlackBerry < Base
    BB_VERSION_REGEX = %r[BlackBerry[\da-z]+/([\d.]+)]
    VERSION_REGEX = %r[Version/([\d.]+)]
    MATCH_REGEX = /BlackBerry|BB10/

    def id
      :blackberry
    end

    def name
      "BlackBerry"
    end

    def full_version
      ua[BB_VERSION_REGEX, 1] ||
        ua[VERSION_REGEX, 1] ||
        "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end

  matchers.unshift(BlackBerry)
end
