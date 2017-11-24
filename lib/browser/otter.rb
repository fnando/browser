# frozen_string_literal: true

module Browser
  class Otter < Base
    VERSION_REGEX = %r[Otter/([\d.]+)]
    MATCH_REGEX = /Otter/

    def id
      :otter
    end

    def name
      "Otter"
    end

    def full_version
      ua[VERSION_REGEX, 1] || "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
