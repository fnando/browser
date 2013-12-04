require "uri"

class Browser
  class Middleware
    def initialize(app, &block)
      raise ArgumentError, "Browser::Middleware requires a block" unless block

      @app = app
      @block = block
    end

    def call(env)
      request = Rack::Request.new(env)

      path = catch(:redirected) do
        Context.new(request).instance_eval(&@block)
      end

      if path
        uri = URI.parse(path)

        if uri.path == request.path
          @app.call(env)
        else
          [301, {"Content-Type" => "text/html", "Location" => path}, []]
        end
      else
        @app.call(env)
      end
    end
  end
end
