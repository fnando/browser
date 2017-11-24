# frozen_string_literal: true

require "browser/platform/base"
require "browser/platform/ios"
require "browser/platform/linux"
require "browser/platform/windows"
require "browser/platform/mac"
require "browser/platform/windows_phone"
require "browser/platform/windows_mobile"
require "browser/platform/firefox_os"
require "browser/platform/blackberry"
require "browser/platform/android"
require "browser/platform/other"
require "browser/platform/chrome_os"
require "browser/platform/adobe_air"

module Browser
  class Platform
    include DetectVersion

    ANDROID_WEBVIEW_REGEX = /\bwv\b/
    WINDOWS_XP_REGEX = /Windows NT 5\.[12]/
    WINDOWS_VISTA_REGEX = /Windows NT 6\.0/
    WINDOWS_7_REGEX = /Windows NT 6\.1/
    WINDOWS_8_REGEX = /Windows NT 6\.[2-3]/
    WINDOWS_81_REGEX = /Windows NT 6\.3/
    WINDOWS_10_REGEX = /Windows NT 10/
    WINDOWS_RT_REGEX = /ARM/
    WINDOWS_64_REGEX = /(Win64|x64|Windows NT 5\.2)/
    WINDOWS_WOW64_REGEX = /WOW64/i
    WINDOWS_TOUCH_REGEX = /Touch/

    attr_reader :browser

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

    def initialize(browser)
      @browser = browser
    end

    def subject
      @subject ||= self.class.matchers
                       .map {|matcher| matcher.new(browser) }
                       .find(&:match?)
    end

    def adobe_air?(expected_version = nil)
      id == :adobe_air && detect_version?(version, expected_version)
    end

    def chrome_os?(expected_version = nil)
      id == :chrome_os && detect_version?(version, expected_version)
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

    def mac?(expected_version = nil)
      id == :mac && detect_version?(version, expected_version)
    end

    def windows?(expected_version = nil)
      id == :windows && detect_version?(version, expected_version)
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
      ios? && !browser.ua.include?("Safari")
    end

    # Detect if is iOS webview.
    def ios_webview?
      ios_app?
    end

    # Detect if in an Android app webview (Lollipop and newer)
    # https://developer.chrome.com/multidevice/user-agent#webview_user_agent
    def android_app?
      android? && browser.ua =~ ANDROID_WEBVIEW_REGEX
    end
    alias_method :android_webview?, :android_app?

    # http://msdn.microsoft.com/fr-FR/library/ms537503.aspx#PltToken
    def windows_xp?
      windows? && browser.ua =~ WINDOWS_XP_REGEX
    end

    def windows_vista?
      windows? && browser.ua =~ WINDOWS_VISTA_REGEX
    end

    def windows7?
      windows? && browser.ua =~ WINDOWS_7_REGEX
    end

    def windows8?
      windows? && browser.ua =~ WINDOWS_8_REGEX
    end

    def windows8_1?
      windows? && browser.ua =~ WINDOWS_81_REGEX
    end

    def windows10?
      windows? && browser.ua =~ WINDOWS_10_REGEX
    end

    def windows_rt?
      windows8? && browser.ua =~ WINDOWS_RT_REGEX
    end

    # Detect if current platform is Windows in 64-bit architecture.
    def windows_x64?
      windows? && browser.ua =~ WINDOWS_64_REGEX
    end

    def windows_wow64?
      windows? && browser.ua =~ WINDOWS_WOW64_REGEX
    end

    def windows_x64_inclusive?
      windows_x64? || windows_wow64?
    end

    def windows_touchscreen_desktop?
      windows? && browser.ua =~ WINDOWS_TOUCH_REGEX
    end
  end
end
