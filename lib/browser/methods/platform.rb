class Browser
  module Platform
    # Detect if browser is Android.
    def android?
      !!(ua =~ /Android/ && !opera?)
    end

    # Detect if browser is ios?.
    def ios?
      ipod? || ipad? || iphone?
    end

    # Detect if is iOS4.
    def ios4?
      ios? && !!(ua =~ /OS 4/)
    end

    # Detect if is iOS5.
    def ios5?
      ios? && !!(ua =~ /OS 5/)
    end

    # Detect if is iOS6.
    def ios6?
      ios? && !!(ua =~ /OS 6/)
    end

    # Detect if is iOS7.
    def ios7?
      ios? && !!(ua =~ /OS 7/)
    end

    # Detect if is iOS8.
    def ios8?
      ios? && !!(ua =~ /OS 8/)
    end

    # Detect if is BlackBerry 4.
    def blackberry4?
      blackberry? && !!(ua =~ %r[BlackBerry\d+/4])
    end

    # Detect if is BlackBerry 5.
    def blackberry5?
      blackberry? && !!(ua =~ %r[BlackBerry\d+/5])
    end

    # Detect if is BlackBerry 6.
    def blackberry6?
      blackberry? && !!(ua =~ %r[Version/6])
    end

    # Detect if is BlackBerry 7.
    def blackberry7?
      blackberry? && !!(ua =~ %r[Version/7])
    end

    # Detect if is BlackBerry 10.
    def blackberry10?
      !!(ua =~ /BB10/)
    end

    # Detect if current platform is Macintosh.
    def mac?
      ua =~ /Mac OS X/ && !ios?
    end

    # Detect if current platform is Windows.
    def windows?
      !!(ua =~ /Windows/)
    end

    def windows8?
      windows? && !!(ua =~ /Windows NT 6.[2-3]/)
    end

    def windows_rt?
      windows8? && !!(ua =~ /ARM/)
    end

    # Detect if current platform is Linux flavor.
    def linux?
      !!(ua =~ /Linux/)
    end

    # Detect if current platform is Windows Mobile.
    def windows_mobile?
      !!(ua =~ /Windows CE/)
    end

    # Detect if current platform is Windows Phone.
    def windows_phone?
      !!(ua =~ /Windows Phone/)
    end

    # Detect if current platform is Windows in 64-bit architecture.
    def windows_x64?
      windows? && !!(ua =~ /(Win64|x64)/) && !!(ua =~ /x64/)
    end

    # Detect if current platform is ChromeOS
    def chrome_os?
      !!(ua =~ /CrOS/)
    end

    # Return the platform.
    def platform
      case
      when linux?     then :linux
      when mac?       then :mac
      when windows?   then :windows
      else
        :other
      end
    end
  end
end
