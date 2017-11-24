# frozen_string_literal: true

module Browser
  module Meta
    class Mobile < Base
      META = "mobile".freeze

      def meta
        META if browser.device.mobile?
      end
    end

    rules << Mobile
  end
end
