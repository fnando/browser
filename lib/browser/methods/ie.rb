class Browser
  module IE
    TRIDENT_VERSION_REGEX = /Trident\/([0-9.]+)/

    # Detect if browser is Internet Explorer.
    def ie?
      !!((ua =~ /MSIE/ && ua !~ /Opera/) || (ua =~ /Trident\/.*rv:\d/))
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
      ie? && !!(ua =~ /rv:11.\d/) && version == "11"
    end

    # Detect if IE is running in compatibility mode.
    def compatibility_view?
      ie? && ua.match(TRIDENT_VERSION_REGEX) && version.to_i < ($1.to_i + 4)
    end
  end
end
