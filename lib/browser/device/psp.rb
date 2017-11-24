# frozen_string_literal: true

module Browser
  class Device
    class PSP < Base
      MATCH_REGEX = /PlayStation Portable/

      def id
        :psp
      end

      def name
        "PlayStation Portable"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
