# frozen_string_literal: true

module Browser
  class Device
    class Surface < Base
      MATCH_REGEX = /Touch/

      def id
        :surface
      end

      def name
        "Microsoft Surface"
      end

      def match?
        browser.platform.windows_rt? && browser.ua =~ MATCH_REGEX
      end
    end
  end
end
