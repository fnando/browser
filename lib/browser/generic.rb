# frozen_string_literal: true

module Browser
  class Generic < Base
    NAMES = {
      "QuickTime" => "QuickTime",
      "CoreMedia" => "Apple CoreMedia"
    }.freeze

    QUICKTIME_VERSION_REGEX = %r[(?:QuickTime)/([\d.]+)]
    CORE_MEDIA_VERSION_REGEX = %r[CoreMedia v([\d.]+)]

    DEFAULT_NAME = "Generic Browser".freeze

    def id
      :generic
    end

    def name
      infer_name || DEFAULT_NAME
    end

    def full_version
      ua[QUICKTIME_VERSION_REGEX, 1] ||
        ua[CORE_MEDIA_VERSION_REGEX, 1] ||
        DEFAULT_FULL_VERSION
    end

    def match?
      true
    end

    private

    def infer_name
      (NAMES.find {|key, _| ua.include?(key) } || []).last
    end
  end
end
