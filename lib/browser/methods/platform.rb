class Browser
  module Platform
    # Detect if browser is Android.
    def android?(version = nil)
      !!(ua =~ /Android/ && !opera?) && detect_version?(android_version, version)
    end

    # Detect Android version.
    def android_version
      ua[/Android ([\d.]+)/, 1]
    end

    # Return the iOS version.
    def ios_version
      ua[/OS (\d)/, 1]
    end

    # Detect if running on iOS app webview.
    def ios_app?
      ios? && !ua.include?("Safari")
    end

    # Detect if is iOS webview.
    def ios_webview?
      ios_app?
    end

    # Detect if browser is ios?.
    def ios?(version = nil)
      (ipod? || ipad? || iphone?) && detect_version?(ios_version, version)
    end

    # Detect if is iOS4.
    def ios4?
      deprecate "Browser##{__method__} is deprecated; use Browser#ios?(version) instead"
      ios?(4)
    end

    # Detect if is iOS5.
    def ios5?
      deprecate "Browser##{__method__} is deprecated; use Browser#ios?(version) instead"
      ios?(5)
    end

    # Detect if is iOS6.
    def ios6?
      deprecate "Browser##{__method__} is deprecated; use Browser#ios?(version) instead"
      ios?(6)
    end

    # Detect if is iOS7.
    def ios7?
      deprecate "Browser##{__method__} is deprecated; use Browser#ios?(version) instead"
      ios?(7)
    end

    # Detect if is iOS8.
    def ios8?
      deprecate "Browser##{__method__} is deprecated; use Browser#ios?(version) instead"
      ios?(8)
    end

    # Detect if is iOS9.
    def ios9?
      deprecate "Browser##{__method__} is deprecated; use Browser#ios?(version) instead"
      ios?(9)
    end

    # Detect if current platform is Macintosh.
    def mac?
      !!(ua =~ /Mac OS X/ && !ios?)
    end

    # Detect if current platform is Windows.
    def windows?
      !!(ua =~ /Windows/)
    end

    ## More info here => http://msdn.microsoft.com/fr-FR/library/ms537503.aspx#PltToken
    def windows_xp?
      windows? && !!(ua =~ /Windows NT 5.1/)
    end

    def windows_vista?
      windows? && !!(ua =~ /Windows NT 6.0/)
    end

    def windows7?
      windows? && !!(ua =~ /Windows NT 6.1/)
    end

    def windows8?
      windows? && !!(ua =~ /Windows NT 6.[2-3]/)
    end

    def windows8_1?
      windows? && !!(ua =~ /Windows NT 6\.3/)
    end

    def windows10?
      windows? && !!(ua =~ /Windows NT 10/)
    end

    def windows_rt?
      windows8? && !!(ua =~ /ARM/)
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
      !!(windows? && ua =~ /(Win64|x64)/)
    end

    def windows_wow64?
      windows? && !!(ua =~ /WOW64/i)
    end

    def windows_x64_inclusive?
      windows_x64? || windows_wow64?
    end

    # Detect if current platform is Linux flavor.
    def linux?
      !!(ua =~ /Linux/)
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
