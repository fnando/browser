class Browser
  module IE
    TRIDENT_VERSION_REGEX = %r[Trident/([0-9.]+)]
    MODERN_IE = %r[Trident/.*?; rv:(.*?)]

    # Detect if browser is Internet Explorer.
    def ie?
      msie? || modern_ie?
    end

    # Detect if browser is Internet Explorer 6.
    def ie6?
      ie? && version == "6"
    end

    # Detect if browser is Internet Explorer 7.
    def ie7?
      ie? && version == "7"
    end

    # Detect if browser is Internet Explorer 8.
    def ie8?
      ie? && version == "8"
    end

    # Detect if browser is Internet Explorer 9.
    def ie9?
      ie? && version == "9"
    end

    # Detect if browser is Internet Explorer 10.
    def ie10?
      ie? && version == "10"
    end

    # Detect if browser is Internet Explorer 11.
    def ie11?
      ie? && version == "11"
    end

    # Detect if IE is running in compatibility mode.
    def compatibility_view?
      match = ua.match(TRIDENT_VERSION_REGEX)
      ie? && match && version.to_i < (match[1].to_i + 4)
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
