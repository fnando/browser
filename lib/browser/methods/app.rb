class Browser
  module App

    # Weixin App
    def weixin?(version = nil)
      !!(ua =~ /MicroMessenger/) && detect_version?(weixin_version, version)
    end

    def weixin_version
      ua[/MicroMessenger\/([\d.]+)/, 1]
    end

    alias_method :wechat?, :weixin?
    alias_method :wechat_version, :weixin_version

  end
end
