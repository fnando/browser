# frozen_string_literal: true

module Browser
  class Device
    class WiiU < Base
      def id
        :wiiu
      end

      def name
        "Nintendo WiiU"
      end

      def match?
        browser.ua =~ /Nintendo WiiU/i
      end
    end
  end
end
