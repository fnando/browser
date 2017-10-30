# frozen_string_literal: true

module Browser
  class Device
    class Base
      attr_reader :browser

      def initialize(browser)
        @browser = browser
      end
    end
  end
end
