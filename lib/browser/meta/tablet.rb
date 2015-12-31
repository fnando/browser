class Browser
  module Meta
    class Tablet < Base
      def meta
        "tablet" if browser.device.tablet?
      end
    end
  end
end
