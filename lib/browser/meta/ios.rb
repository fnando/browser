# frozen_string_literal: true

module Browser
  module Meta
    class IOS < Base
      def meta
        "ios" if browser.platform.ios?
      end
    end

    rules << IOS
  end
end
