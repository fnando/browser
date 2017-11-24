# frozen_string_literal: true

module Browser
  class Edge < InternetExplorer
    VERSION_REGEX = %r[Edge/([\d.]+)]
    MATCH_REGEX = %r[(Edge/[\d.]+|Trident/8)]

    def id
      :edge
    end

    def name
      "Microsoft Edge"
    end

    def full_version
      ua[VERSION_REGEX, 1] || super
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
