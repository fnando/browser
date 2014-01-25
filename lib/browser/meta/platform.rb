class Browser
  module Meta
    class Platform < Base
      def meta
        browser.platform
      end
    end
  end
end
