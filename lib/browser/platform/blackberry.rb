# frozen_string_literal: true

module Browser
  class Platform
    class BlackBerry < Base
      def match?
        browser.ua =~ /BB10|BlackBerry/
      end

      def name
        "BlackBerry"
      end

      def id
        :blackberry
      end

      def version
        browser.ua[%r[(?:Version|BlackBerry[\da-z]+)/([\d.]+)], 1]
      end
    end
  end
end
