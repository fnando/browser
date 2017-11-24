# frozen_string_literal: true

module Browser
  class Device
    class Surface < Base
      def id
        :surface
      end

      def name
        "Microsoft Surface"
      end

      def match?
        browser.platform.windows_rt? && browser.ua =~ /Touch/
      end
    end
  end
end
