# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is Microsoft Edge.
    def edge?(expected_version = nil)
      Edge.new(ua).match? && detect_version?(full_version, expected_version)
    end
  end

  class Edge < InternetExplorer
    VERSION_REGEX = %r[Edge/([\d.]+)]
    MATCH_REGEX = %r[(Edge/[\d.]+|Trident/8)]
    NAME = "Microsoft Edge".freeze

    def id
      :edge
    end

    def name
      NAME
    end

    def full_version
      ua[VERSION_REGEX, 1] || super
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
