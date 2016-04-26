# frozen_string_literal: true
module Browser
  class Opera < Base
    def id
      :opera
    end

    BROWSER_NAME = 'Opera'
    def name
      BROWSER_NAME
    end

    VERSION_REGEX_1 = %r[OPR/([\d.]+)] 
    VERSION_REGEX_2 = %r[Version/([\d.]+)]
    def full_version
      ua[VERSION_REGEX_1, 1] || ua[VERSION_REGEX_2, 1] || DEFAULT_VERSION
    end

    MATCH_REGEX = /(Opera|OPR)/
    def match?
      ua =~ MATCH_REGEX
    end
  end
end
