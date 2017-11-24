# frozen_string_literal: true

module Browser
  class Electron < Base
    VERSION_REGEX = %r[Electron/([\d.]+)]
    MATCH_REGEX = /Electron/

    def id
      :electron
    end

    def name
      "Electron"
    end

    def full_version
      ua[VERSION_REGEX, 1] ||
        "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
