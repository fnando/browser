# frozen_string_literal: true

module Browser
  module Meta
    class IOS < Base
      META = "ios".freeze

      def meta
        META if browser.platform.ios?
      end
    end

    rules << IOS
  end
end
