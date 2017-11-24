# frozen_string_literal: true

module Browser
  class Base
    include DetectVersion

    QUICKTIME_REGEX = /QuickTime/i
    CORE_MEDIA_REGEX = /CoreMedia/

    attr_reader :ua

    # Return an array with all preferred languages that this browser accepts.
    attr_reader :accept_language

    def initialize(ua, accept_language: nil)
      @ua = ua.strip
      @accept_language = AcceptLanguage.parse(accept_language)
    end

    # Return a meta info about this browser.
    def meta
      Meta.get(self)
    end
    alias_method :to_a, :meta

    # Return meta representation as string.
    def to_s
      meta.to_a.join(SPACE)
    end

    def version
      full_version.split(DOT).first || DEFAULT_VERSION
    end

    # Detect if browser is QuickTime
    def quicktime?(expected_version = nil)
      ua =~ QUICKTIME_REGEX && detect_version?(full_version, expected_version)
    end

    # Detect if browser is Apple CoreMedia.
    def core_media?(expected_version = nil)
      ua =~ CORE_MEDIA_REGEX && detect_version?(full_version, expected_version)
    end

    def known?
      id != :generic
    end
  end
end
