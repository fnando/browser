class Browser
  module Meta
    class Webkit < Base
      def meta
        "webkit" if browser.webkit?
      end
    end
  end
end
