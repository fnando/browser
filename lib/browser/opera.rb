# frozen_string_literal: true

module Browser
  class Base
    OPERA_MINI_REGEX = /Opera Mini/

    # Detect if browser is Opera.
    def opera?(expected_version = nil)
      Opera.new(ua).match? && detect_version?(full_version, expected_version)
    end

    # Detect if browser is Opera Mini.
    def opera_mini?(expected_version = nil)
      ua =~ OPERA_MINI_REGEX && detect_version?(full_version, expected_version)
    end
  end

  class Opera < Base
    OPR_REGEX = %r[OPR/([\d.]+)]
    VERSION_REGEX = %r[Version/([\d.]+)]
    MATCH_REGEX = /(Opera|OPR\/)/

    def id
      :opera
    end

    def name
      "Opera"
    end

    def full_version
      ua[OPR_REGEX, 1] || ua[VERSION_REGEX, 1] || "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
