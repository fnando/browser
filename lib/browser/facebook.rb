# frozen_string_literal: true

module Browser
  class Facebook < Base
    VERSION_REGEX = %r[FBAV/([\d.]+)]
    MATCH_REGEX = /FBAV/

    def id
      :facebook
    end

    def name
      "Facebook"
    end

    def full_version
      ua[VERSION_REGEX, 1]
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
