class Browser
  module Meta
    class GenericBrowser < Base
      def meta
        "#{browser.id} #{browser.id}#{browser.version}" unless browser.safari? || browser.chrome?
      end
    end
  end
end
