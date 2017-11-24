# frozen_string_literal: true

module Browser
  module Meta
    class Platform < Base
      def meta
        browser.platform.id
      end
    end

    rules << Platform
  end
end
