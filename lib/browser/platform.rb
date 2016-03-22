# frozen_string_literal: true
module Browser
  class Platform
    include DetectVersion

    attr_reader :ua

    # Hold the list of platform matchers.
    # Order is important.
    def self.matchers
      @matchers ||= [
        AdobeAir,
        ChromeOS,
        WindowsMobile,
        WindowsPhone,
        Android,
        BlackBerry,
        IOS,
        Mac,
        FirefoxOS,
        Windows,
        Linux,
        Other
      ]
    end

    def initialize(ua)
      @ua = ua
    end

    def subject
      @subject ||= self.class.matchers
                   .map {|matcher| matcher.new(ua) }
                   .find(&:match?)
    end

    def adobe_air?
      id == :adobe_air
    end

    def chrome_os?
      id == :chrome_os
    end

    def android?(expected_version = nil)
      id == :android && detect_version?(version, expected_version)
    end

    def other?
      id == :other
    end

    def linux?
      id == :linux
    end

    def mac?
      id == :mac
    end

    def windows?
      id == :windows
    end

    def firefox_os?
      id == :firefox_os
    end

    def ios?(expected_version = nil)
      id == :ios && detect_version?(version, expected_version)
    end

    def blackberry?(expected_version = nil)
      id == :blackberry && detect_version?(version, expected_version)
    end

    def windows_phone?(expected_version = nil)
      id == :windows_phone && detect_version?(version, expected_version)
    end

    def windows_mobile?(expected_version = nil)
      id == :windows_mobile && detect_version?(version, expected_version)
    end

    def id
      subject.id
    end

    def version
      subject.version
    end

    def name
      subject.name
    end

    def to_s
      id.to_s
    end

    def ==(other)
      id == other
    end

    # Detect if running on iOS app webview.
    def ios_app?
      ios? && !ua.include?("Safari")
    end

    # Detect if is iOS webview.
    def ios_webview?
      ios_app?
    end

    # http://msdn.microsoft.com/fr-FR/library/ms537503.aspx#PltToken
    WINDOWS_XP_REGEX = /Windows NT 5\.[12]/
    def windows_xp?
      windows? && ua =~ WINDOWS_XP_REGEX
    end

    WINDOWS_VISTA_REGEX = /Windows NT 6\.0/
    def windows_vista?
      windows? && ua =~ WINDOWS_VISTA_REGEX
    end

    WINDOWS_7_REGEX = /Windows NT 6\.1/
    def windows7?
      windows? && ua =~ WINDOWS_7_REGEX
    end

    WINDOWS_8_REGEX = /Windows NT 6\.[2-3]/
    def windows8?
      windows? && ua =~ WINDOWS_8_REGEX
    end

    WINDOWS_8_1_REGEX = /Windows NT 6\.3/
    def windows8_1?
      windows? && ua =~ WINDOWS_8_1_REGEX
    end

    WINDOWS_10_REGEX = /Windows NT 10/
    def windows10?
      windows? && ua =~ WINDOWS_10_REGEX
    end

    WINDOWS_RT_REGEX = /ARM/
    def windows_rt?
      windows8? && ua =~ WINDOWS_RT_REGEX
    end

    # Detect if current platform is Windows in 64-bit architecture.
    WINDOW_X64_REGEX = /(Win64|x64|Windows NT 5\.2)/
    def windows_x64?
      windows? && ua =~ WINDOW_X64_REGEX
    end

    WINDOWS_WOW64_REGEX = /WOW64/i
    def windows_wow64?
      windows? && ua =~ WINDOWS_WOW64_REGEX
    end

    def windows_x64_inclusive?
      windows_x64? || windows_wow64?
    end

    WINDOWS_TOUCH_REGEX = /Touch/
    def windows_touchscreen_desktop?
      windows? && ua =~ WINDOWS_TOUCH_REGEX
    end
  end
end
