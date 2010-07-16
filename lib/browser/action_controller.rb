class Browser
  module ActionController # :nodoc: all
    def self.included(base)
      base.send :helper_method, :browser
    end

    private
    def browser
      @browser ||= Browser.new(
        :accept_language => request.headers["ACCEPT_LANGUAGE"],
        :ua => request.headers["USER_AGENT"]
      )
    end
  end
end

ActionController::Base.send :include, Browser::ActionController
