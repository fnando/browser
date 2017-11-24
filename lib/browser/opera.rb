# frozen_string_literal: true

module Browser
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
