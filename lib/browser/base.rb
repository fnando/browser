# frozen_string_literal: true
module Browser
  class Base
    include DetectVersion

    attr_reader :ua

    # Return an array with all preferred languages that this browser accepts.
    attr_reader :accept_language

    def initialize(ua, accept_language: nil)
      @ua = ua
      @accept_language = AcceptLanguage.parse(accept_language)
    end

    # Return a meta info about this browser.
    def meta
      Meta.get(self)
    end

    alias_method :to_a, :meta

    # Return meta representation as string.
    def to_s
      meta.to_a.join(" ")
    end

    def version
      full_version.split(".").first
    end

    # Return the platform.
    def platform
      @platform ||= Platform.new(ua)
    end

    # Return the bot info.
    def bot
      @bot ||= Bot.new(ua)
    end

    # Detect if current user agent is from a bot.
    def bot?
      bot.bot?
    end

    # Return the device info.
    def device
      @device ||= Device.new(ua)
    end

    # Return true if browser is modern (Webkit, Firefox 17+, IE9+, Opera 12+).
    def modern?
      Browser.modern_rules.any? {|rule| rule === self } # rubocop:disable Metrics/LineLength, Style/CaseEquality
    end

    # Detect if browser is Microsoft Internet Explorer.
    def ie?(expected_version = nil)
      InternetExplorer.new(ua).match? &&
        detect_version?(version, expected_version)
    end

    # Detect if browser is Microsoft Edge.
    def edge?
      Edge.new(ua).match?
    end

    def compatibility_view?
      false
    end

    def msie_full_version
      "0.0"
    end

    def msie_version
      "0"
    end

    # Detect if browser is WebKit-based.
    def webkit?
      ua =~ /AppleWebKit/i && !edge?
    end

    # Detect if browser is QuickTime
    def quicktime?
      ua =~ /QuickTime/i
    end

    # Detect if browser is Apple CoreMedia.
    def core_media?
      ua =~ /CoreMedia/
    end

    # Detect if browser is PhantomJS
    def phantom_js?
      PhantomJS.new(ua).match?
    end

    # Detect if browser is Safari.
    def safari?(expected_version = nil)
      Safari.new(ua).match? && detect_version?(version, expected_version)
    end

    def safari_webapp_mode?
      (device.ipad? || device.iphone?) && ua =~ /AppleWebKit/
    end

    # Detect if browser is Firefox.
    def firefox?
      Firefox.new(ua).match?
    end

    # Detect if browser is Chrome.
    def chrome?
      Chrome.new(ua).match?
    end

    # Detect if browser is Opera.
    def opera?
      Opera.new(ua).match?
    end

    # Detect if browser is Yandex.
    def yandex?
      ua =~ /YaBrowser/
    end

    # Detect if browser is UCBrowser.
    def uc_browser?
      UCBrowser.new(ua).match?
    end

    # Detect if browser is Nokia S40 Ovi Browser.
    def nokia?
      Nokia.new(ua).match?
    end

    # Detect if browser is MicroMessenger.
    def micro_messenger?
      MicroMessenger.new(ua).match?
    end

    alias_method :wechat?, :micro_messenger?

    def weibo?
      Weibo.new(ua).match?
    end

    # Detect if browser is Opera Mini.
    def opera_mini?
      ua =~ /Opera Mini/
    end

    def webkit_full_version
      ua[%r[AppleWebKit/([\d.]+)], 1] || "0.0"
    end

    def known?
      id != :generic
    end

    # Detect if browser is a proxy browser.
    def proxy?
      nokia? || uc_browser? || opera_mini?
    end
  end
end
