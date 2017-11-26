# frozen_string_literal: true

require "browser/middleware/context/url_methods"

module Browser
  class Middleware
    class Context
      module Additions
        def self.included(base)
          base.class_eval do
            include Rails.application.routes.url_helpers
            include UrlMethods
          end
        end
      end
    end
  end
end
