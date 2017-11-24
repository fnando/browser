# frozen_string_literal: true

module Browser
  class Base
    # Detect if the browser is Electron.
    def electron?(expected_version = nil)
      Electron.new(ua).match? && detect_version?(full_version, expected_version)
    end
  end

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

  matchers.unshift(Electron)
end
