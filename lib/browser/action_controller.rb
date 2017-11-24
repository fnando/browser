# frozen_string_literal: true

require "action_controller/railtie"

module Browser
  module ActionController
    extend ActiveSupport::Concern

    USER_AGENT = "User-Agent".freeze
    ACCEPT_LANGUAGE = "Accept-Language".freeze

    included do
      helper_method(:browser) if respond_to?(:helper_method)
    end

    private

    def browser
      @browser ||= Browser.new(
        request.headers[USER_AGENT],
        accept_language: request.headers[ACCEPT_LANGUAGE]
      )
    end
  end
end
