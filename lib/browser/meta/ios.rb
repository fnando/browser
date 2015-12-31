class Browser
  module Meta
    class IOS < Base
      def meta
        "ios" if browser.platform.ios?
      end
    end
  end
end
