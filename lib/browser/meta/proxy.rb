# frozen_string_literal: true

module Browser
  module Meta
    class Proxy < Base
      META = "proxy".freeze

      def meta
        META if browser.proxy?
      end
    end

    rules << Proxy
  end
end
