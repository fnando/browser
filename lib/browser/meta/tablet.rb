# frozen_string_literal: true

module Browser
  module Meta
    class Tablet < Base
      META = "tablet".freeze

      def meta
        META if browser.device.tablet?
      end
    end

    rules << Tablet
  end
end
