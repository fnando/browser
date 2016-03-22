# frozen_string_literal: true
module Browser
  class BlackBerry < Base
    def id
      :blackberry
    end

    BROWSER_NAME = 'BlackBerry'
    def name
      BROWSER_NAME
    end

    VERSION_REGEX_1 = %r[BlackBerry[\da-z]+/([\d.]+)]
    VERSION_REGEX_2 = %r[Version/([\d.]+)]
    def full_version
      ua[VERSION_REGEX_1, 1] ||
        ua[VERSION_REGEX_2, 1] ||
        DEFAULT_VERSION
    end

    MATCH_REGEX = /BlackBerry|BB10/
    def match?
      ua =~ MATCH_REGEX
    end
  end
end
