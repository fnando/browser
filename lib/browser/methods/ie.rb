class Browser
  module IE
    TRIDENT_VERSION_REGEX = %r[Trident/([0-9.]+)]
    MODERN_IE = %r[Trident/.*?; rv:(.*?)]
    MSIE = %r{MSIE ([\d.]+)|Trident/.*?; rv:([\d.]+)}
    EDGE = %r{(Edge/[\d.]+|Trident/8)}

    # https://msdn.microsoft.com/en-us/library/ms537503(v=vs.85).aspx#TriToken
    TRIDENT_MAPPING = {
      "4.0" => "8",
      "5.0" => "9",
      "6.0" => "10",
      "7.0" => "11",
      "8.0" => "12"
    }

    def ie_version
      TRIDENT_MAPPING[trident_version] || msie_version
    end

    def ie_full_version
      "#{ie_version}.0"
    end

    def msie_full_version
      (ua.match(MSIE) && ($1 || $2)) || "0.0"
    end

    def msie_version
      msie_full_version.to_s.split(".").first || "0"
    end

    # Return the trident version.
    def trident_version
      ua.match(TRIDENT_VERSION_REGEX) && $1
    end

    # Detect if browser is Internet Explorer.
    def ie?(version = nil)
      (msie? || modern_ie?) && detect_version?(ie_version, version)
    end

    # Detect if browser is Microsoft Edge.
    def edge?
      !!(ua =~ EDGE)
    end

    # Detect if IE is running in compatibility mode.
    def compatibility_view?
      ie? && trident_version && msie_version.to_i < (trident_version.to_i + 4)
    end

    private

    def msie?
      !!(ua =~ /MSIE/ && ua !~ /Opera/)
    end

    def modern_ie?
      !!(ua =~ MODERN_IE)
    end
  end
end
