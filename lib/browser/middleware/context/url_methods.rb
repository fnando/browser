class Browser
  class Middleware
    class Context
      module UrlMethods
        def default_url_options
          Rails.configuration.browser.default_url_options ||
          Rails.configuration.action_mailer.default_url_options ||
          {}
        end
      end
    end
  end
end
