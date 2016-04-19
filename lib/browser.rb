# frozen_string_literal: true
require "set"
require "yaml"
require "pathname"

require "browser/detect_version"
require "browser/accept_language"
require "browser/base"
require "browser/safari"
require "browser/chrome"
require "browser/internet_explorer"
require "browser/firefox"
require "browser/edge"
require "browser/opera"
require "browser/blackberry"
require "browser/generic"
require "browser/phantom_js"
require "browser/uc_browser"
require "browser/nokia"
require "browser/micro_messenger"
require "browser/weibo"

require "browser/bot"
require "browser/middleware"
require "browser/middleware/context"
require "browser/rails" if defined?(::Rails)

require "browser/platform"
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

require "browser/device"
require "browser/device/base"
require "browser/device/unknown"
require "browser/device/ipad"
require "browser/device/ipod_touch"
require "browser/device/iphone"
require "browser/device/playstation3"
require "browser/device/playstation4"
require "browser/device/psp"
require "browser/device/psvita"
require "browser/device/kindle"
require "browser/device/kindle_fire"
require "browser/device/wii"
require "browser/device/wiiu"
require "browser/device/blackberry_playbook"
require "browser/device/surface"
require "browser/device/tv"
require "browser/device/xbox_one"
require "browser/device/xbox_360"

require "browser/meta/base"
require "browser/meta/generic_browser"
require "browser/meta/id"
require "browser/meta/ie"
require "browser/meta/ios"
require "browser/meta/mobile"
require "browser/meta/modern"
require "browser/meta/platform"
require "browser/meta/proxy"
require "browser/meta/safari"
require "browser/meta/webkit"
require "browser/meta/tablet"
require "browser/meta/device"

module Browser
  EMPTY_STRING = "".freeze

  def self.root
    @root ||= Pathname.new(File.expand_path("../..", __FILE__))
  end

  # Hold the list of browser matchers.
  # Order is important.
  def self.matchers
    @matchers ||= [
      Nokia,
      UCBrowser,
      PhantomJS,
      BlackBerry,
      Opera,
      Edge,
      InternetExplorer,
      Firefox,
      Weibo,                # must be placed before Chrome and Safari
      Chrome,
      Safari,
      MicroMessenger,
      Generic
    ]
  end

  # Define the rules which define a modern browser.
  # A rule must be a proc/lambda or any object that implements the method
  # === and accepts the browser object.
  #
  # To redefine all rules, clear the existing rules before adding your own.
  #
  #   # Only Chrome Canary is considered modern.
  #   Browser.modern_rules.clear
  #   Browser.modern_rules << -> b { b.chrome? && b.version >= "37" }
  #
  def self.modern_rules
    @modern_rules ||= []
  end

  modern_rules.tap do |rules|
    rules << -> (b) { b.webkit? }
    rules << -> (b) { b.firefox? && b.version.to_i >= 17 }
    rules << -> (b) { b.ie? && b.version.to_i >= 9 && !b.compatibility_view? }
    rules << -> (b) { b.edge? && !b.compatibility_view? }
    rules << -> (b) { b.opera? && b.version.to_i >= 12 }
    rules << -> (b) { b.firefox? && b.device.tablet? && b.platform.android? && b.version.to_i >= 14 } # rubocop:disable Metrics/LineLength
  end

  def self.new(user_agent, **kwargs)
    matchers
      .map {|klass| klass.new(user_agent || EMPTY_STRING, **kwargs) }
      .find(&:match?)
  end
end
