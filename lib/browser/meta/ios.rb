class Browser
  module Meta
    class IOS < Base
      def meta
        "ios" if browser.ios?
      end
    end
  end
end
