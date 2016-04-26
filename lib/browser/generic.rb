# frozen_string_literal: true
module Browser
  class Generic < Base
    NAMES = {
      "QuickTime" => "QuickTime",
      "CoreMedia" => "Apple CoreMedia"
    }

    def id
      :generic
    end

    BROWSER_NAME = "Generic Browser"
    def name
      infer_name || BROWSER_NAME
    end

    QUICKTIME_VERSION_REGEX = %r[(?:QuickTime)/([\d.]+)]
    COREMEDIA_VERSION_REGEX = %r[CoreMedia v([\d.]+)]
    def full_version
      ua[QUICKTIME_VERSION_REGEX, 1] ||
        ua[COREMEDIA_VERSION_REGEX, 1] ||
        DEFAULT_VERSION
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
