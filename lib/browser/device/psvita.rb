# frozen_string_literal: true

module Browser
  class Device
    class PSVita < Base
      MATCH_REGEX = /Playstation Vita/

      def id
        :psvita
      end

      def name
        "PlayStation Vita"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
