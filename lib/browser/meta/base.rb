class Browser
  module Meta
    class Base
      # Set the browser instance.
      attr_reader :browser

      def initialize(browser)
        @browser = browser
      end

      def meta
        nil
      end

      def to_a
        meta.to_s.squeeze(" ").split(" ")
      end
    end
  end
end
