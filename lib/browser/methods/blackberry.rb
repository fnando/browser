class Browser
  module BlackBerry
    # Return BlackBerry version.
    def blackberry_version
      ua[/BB(10)/, 1] ||
      ua[/BlackBerry\d+\/(\d+)/, 1] ||
      ua[/BlackBerry.*?Version\/(\d+)/, 1]
    end

    # Detect if browser is BlackBerry
    def blackberry?(version = nil)
      !!(ua =~ /(BlackBerry|BB10)/) && detect_version?(blackberry_version, version)
    end

    # Detect if is BlackBerry 4.
    def blackberry4?
      deprecate "Browser##{__method__} is deprecated; use Browser#ie?(version) instead"
      blackberry?(4)
    end

    # Detect if is BlackBerry 5.
    def blackberry5?
      deprecate "Browser##{__method__} is deprecated; use Browser#ie?(version) instead"
      blackberry?(5)
    end

    # Detect if is BlackBerry 6.
    def blackberry6?
      deprecate "Browser##{__method__} is deprecated; use Browser#ie?(version) instead"
      blackberry?(6)
    end

    # Detect if is BlackBerry 7.
    def blackberry7?
      deprecate "Browser##{__method__} is deprecated; use Browser#ie?(version) instead"
      blackberry?(7)
    end

    # Detect if is BlackBerry 10.
    def blackberry10?
      deprecate "Browser##{__method__} is deprecated; use Browser#blackberry?(version) instead"
      blackberry?(10)
    end

    private

    def blackberry_running_safari?
      blackberry? && safari?
    end
  end
end
