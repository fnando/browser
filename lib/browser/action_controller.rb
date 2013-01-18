class Browser
  module ActionController # :nodoc: all
    def self.included(base)
      base.send :helper_method, :browser
    end

    private
    def browser
      @browser ||= Browser.new(
        :accept_language => request.headers["Accept-Language"] || request.headers['HTTP_ACCEPT_LANGUAGE'],
        :ua => request.headers["User-Agent"] || request.headers['HTTP_USER_AGENT']
      )
    end
  end
end

ActionController::Base.send :include, Browser::ActionController
