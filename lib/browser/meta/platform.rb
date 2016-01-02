module Browser
  module Meta
    class Platform < Base
      def meta
        browser.platform.id
      end
    end
  end
end
