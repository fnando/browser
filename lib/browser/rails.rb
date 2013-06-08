require "rails/railtie"
require "browser/action_controller"
require "browser/middleware/context/additions"

class Browser
  class Railtie < Rails::Railtie
    config.browser = ActiveSupport::OrderedOptions.new

    initializer "browser" do
      ::ActionController::Base.send :include, Browser::ActionController
      Browser::Middleware::Context.send :include, Browser::Middleware::Context::Additions
    end
  end
end
