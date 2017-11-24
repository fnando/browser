# frozen_string_literal: true

module Browser
  class InternetExplorer < Base
    # https://msdn.microsoft.com/en-us/library/ms537503(v=vs.85).aspx#TriToken
    TRIDENT_MAPPING = {
      "4.0" => "8",
      "5.0" => "9",
      "6.0" => "10",
      "7.0" => "11",
      "8.0" => "12"
    }.freeze

    MSIE_VERSION_REGEX = %r{MSIE ([\d.]+)|Trident/.*?; rv:([\d.]+)}
    TRIDENT_VERSION_REGEX = %r[Trident/([0-9.]+)]
    MSIE_REGEX = /MSIE/
    OPERA_REGEX = /Opera/
    MODERN_IE_REGEX = %r[Trident/.*?; rv:(.*?)]

    def id
      :ie
    end

    def name
      "Internet Explorer"
    end

    def full_version
      "#{ie_version}.0"
    end

    def msie_full_version
      (ua.match(MSIE_VERSION_REGEX) && ($1 || $2)) ||
        "0.0"
    end

    def msie_version
      msie_full_version.split(".").first
    end

    def match?
      msie? || modern_ie?
    end

    # Detect if IE is running in compatibility mode.
    def compatibility_view?
      trident_version && msie_version.to_i < (trident_version.to_i + 4)
    end

    private

    def ie_version
      TRIDENT_MAPPING[trident_version] || msie_version
    end

    # Return the trident version.
    def trident_version
      ua.match(TRIDENT_VERSION_REGEX) && $1
    end

    def msie?
      ua =~ MSIE_REGEX && ua !~ OPERA_REGEX
    end

    def modern_ie?
      ua =~ MODERN_IE_REGEX
    end
  end
end
