# frozen_string_literal: true

module Browser
  class Platform
    class Base
      attr_reader :browser

      def initialize(browser)
        @browser = browser
      end

      def match?
        false
      end
    end
  end
end
