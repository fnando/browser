# frozen_string_literal: true

module Browser
  class Base
    include DetectVersion

    attr_reader :ua

    def initialize(ua, accept_language: nil)
      validate_size(:user_agent, ua.to_s)

      @ua = ua
      @accept_language_raw = accept_language.to_s
    end

    # Return a meta info about this browser.
    def meta
      Meta.get(self)
    end

    # Return an array with all preferred languages that this browser accepts.
    def accept_language
      @accept_language ||= begin
        validate_size(:accept_language, @accept_language_raw)
        AcceptLanguage.parse(@accept_language_raw)
      end
    end

    alias to_a meta

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

    # Detect if browser is Microsoft Internet Explorer.
    def ie?(expected_version = nil)
      instance_of?(InternetExplorer) &&
        detect_version?(full_version, expected_version)
    end

    # Detect if browser is Microsoft Edge.
    def edge?(expected_version = nil)
      instance_of?(Edge) && detect_version?(full_version, expected_version)
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

    # Detect if browser is Instagram.
    def instagram?(expected_version = nil)
      instance_of?(Instagram) &&
        detect_version?(full_version, expected_version)
    end

    # Detect if browser is Snapchat.
    def snapchat?(expected_version = nil)
      instance_of?(Snapchat) &&
        detect_version?(full_version, expected_version)
    end

    # Detect if browser if Facebook.
    def facebook?(expected_version = nil)
      instance_of?(Facebook) &&
        detect_version?(full_version, expected_version)
    end

    # Detect if browser is Otter.
    def otter?(expected_version = nil)
      instance_of?(Otter) &&
        detect_version?(full_version, expected_version)
    end

    # Detect if browser is WebKit-based.
    def webkit?(expected_version = nil)
      ua.match?(/AppleWebKit/i) &&
        (!edge? || chromium_based?) &&
        detect_version?(webkit_full_version, expected_version)
    end

    # Detect if browser is QuickTime
    def quicktime?(expected_version = nil)
      ua.match?(/QuickTime/i) && detect_version?(full_version, expected_version)
    end

    # Detect if browser is Apple CoreMedia.
    def core_media?(expected_version = nil)
      ua.include?("CoreMedia") && detect_version?(full_version,
                                                  expected_version)
    end

    # Detect if browser is PhantomJS
    def phantom_js?(expected_version = nil)
      instance_of?(PhantomJS) &&
        detect_version?(full_version, expected_version)
    end

    # Detect if browser is Safari.
    def safari?(expected_version = nil)
      instance_of?(Safari) && detect_version?(full_version, expected_version)
    end

    def safari_webapp_mode?
      (device.ipad? || device.iphone?) && ua.include?("AppleWebKit")
    end

    # Detect if browser is Firefox.
    def firefox?(expected_version = nil)
      instance_of?(Firefox) && detect_version?(full_version, expected_version)
    end

    # Detect if browser is Chrome.
    def chrome?(expected_version = nil)
      instance_of?(Chrome) && detect_version?(full_version, expected_version)
    end

    # Detect if browser is Opera.
    def opera?(expected_version = nil)
      instance_of?(Opera) && detect_version?(full_version, expected_version)
    end

    # Detect if browser is Sputnik.
    def sputnik?(expected_version = nil)
      instance_of?(Sputnik) && detect_version?(full_version, expected_version)
    end

    # Detect if browser is Yandex.
    def yandex?(expected_version = nil)
      instance_of?(Yandex) && detect_version?(full_version, expected_version)
    end
    alias yandex_browser? yandex?

    # Detect if browser is UCBrowser.
    def uc_browser?(expected_version = nil)
      instance_of?(UCBrowser) &&
        detect_version?(full_version, expected_version)
    end

    # Detect if browser is Nokia S40 Ovi Browser.
    def nokia?(expected_version = nil)
      instance_of?(Nokia) && detect_version?(full_version, expected_version)
    end

    # Detect if browser is MicroMessenger.
    def micro_messenger?(expected_version = nil)
      instance_of?(MicroMessenger) &&
        detect_version?(full_version, expected_version)
    end

    alias wechat? micro_messenger?

    def weibo?(expected_version = nil)
      instance_of?(Weibo) && detect_version?(full_version, expected_version)
    end

    def alipay?(expected_version = nil)
      instance_of?(Alipay) && detect_version?(full_version, expected_version)
    end

    # Detect if browser is Opera Mini.
    def opera_mini?(expected_version = nil)
      ua.include?("Opera Mini") && detect_version?(full_version,
                                                   expected_version)
    end

    # Detect if browser is DuckDuckGo.
    def duck_duck_go?(expected_version = nil)
      ua.include?("DuckDuckGo") && detect_version?(full_version,
                                                   expected_version)
    end

    # Detect if browser is Samsung.
    def samsung_browser?(expected_version = nil)
      ua.include?("SamsungBrowser") && detect_version?(full_version,
                                                       expected_version)
    end

    # Detect if browser is Huawei.
    def huawei_browser?(expected_version = nil)
      instance_of?(HuaweiBrowser) &&
        detect_version?(full_version, expected_version)
    end

    # Detect if browser is Xiaomi Miui.
    def miui_browser?(expected_version = nil)
      instance_of?(MiuiBrowser) &&
        detect_version?(full_version, expected_version)
    end

    # Detect if browser is Maxthon.
    def maxthon?(expected_version = nil)
      instance_of?(Maxthon) && detect_version?(full_version, expected_version)
    end

    # Detect if browser is QQ.
    def qq?(expected_version = nil)
      instance_of?(QQ) && detect_version?(full_version, expected_version)
    end

    # Detect if browser is Sougou.
    def sougou_browser?(expected_version = nil)
      instance_of?(SougouBrowser) &&
        detect_version?(full_version, expected_version)
    end

    # Detect if browser is Google Search App
    def google_search_app?(expected_version = nil)
      ua.include?("GSA") && detect_version?(full_version, expected_version)
    end

    # Detect if browser is Chromium-based.
    def chromium_based?
      false
    end

    def webkit_full_version
      ua[%r{AppleWebKit/([\d.]+)}, 1] || "0.0"
    end

    def known?
      !unknown?
    end

    def unknown?
      id == :unknown_browser
    end

    # Detect if browser is a proxy browser.
    def proxy?
      nokia? || uc_browser? || opera_mini?
    end

    # Detect if the browser is Electron.
    def electron?(expected_version = nil)
      instance_of?(Electron) && detect_version?(full_version, expected_version)
    end

    # Detect if the browser is Epiphany.
    def epiphany?(expected_version = nil)
      instance_of?(Epiphany) && detect_version?(full_version, expected_version)
    end

    private def validate_size(subject, input)
      actual_bytesize = input.bytesize
      size_limit = Browser.public_send(:"#{subject}_size_limit")

      return if actual_bytesize < size_limit

      raise Error,
            "#{subject} cannot be larger than #{size_limit} bytes; " \
            "actual size is #{actual_bytesize} bytes"
    end
  end
end
