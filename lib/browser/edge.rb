# frozen_string_literal: true
module Browser
  class Edge < InternetExplorer
    def id
      :edge
    end

    BROWSER_NAME = "Microsoft Edge"
    def name
      BROWSER_NAME
    end

    VERSION_REGEX = %r[Edge/([\d.]+)]
    def full_version
      ua[VERSION_REGEX, 1] || super
    end

    MATCH_REGEX = %r[(Edge/[\d.]+|Trident/8)]
    def match?
      ua =~ MATCH_REGEX
    end
  end
end
