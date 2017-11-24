# frozen_string_literal: true

module Browser
  class Platform
    class Android < Base
      def match?
        browser.ua =~ /Android/
      end

      def name
        "Android"
      end

      def id
        :android
      end

      def version
        browser.ua[/Android ([\d.]+)/, 1]
      end
    end
  end
end
