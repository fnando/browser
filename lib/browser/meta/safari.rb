class Browser
  module Meta
    class Safari < Base
      def meta
        "safari safari#{browser.version}" if browser.safari?
      end
    end
  end
end
