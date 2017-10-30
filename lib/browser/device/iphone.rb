# frozen_string_literal: true

module Browser
  class Device
    class Iphone < Base
      def id
        :iphone
      end

      def name
        "iPhone"
      end

      def match?
        browser.ua =~ /iPhone/
      end
    end
  end
end
