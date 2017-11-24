# frozen_string_literal: true

module Browser
  module Meta
    class Webkit < Base
      META = "webkit".freeze

      def meta
        META if browser.webkit?
      end
    end
  end
end
