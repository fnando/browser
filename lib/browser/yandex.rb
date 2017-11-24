# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is Yandex.
    def yandex?(expected_version = nil)
      ua =~ YANDEX_REGEX && detect_version?(full_version, expected_version)
    end
  end

  class Yandex < Chromium
    MATCH_REGEX = /YaBrowser/

    def id
      :yandex
    end

    def name
      "Yandex"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end

  matchers.unshift(Yandex)
end
