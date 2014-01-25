class Browser
  module Meta
    class Mobile < Base
      def meta
        "mobile" if browser.mobile?
      end
    end
  end
end
