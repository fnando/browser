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
          redirect(path)
        end
      else
        @app.call(env)
      end
    end

    def redirect(path)
      [302, {"Content-Type" => "text/html", "Location" => path}, []]
    end
  end
end
