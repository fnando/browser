require "uri"

class Browser
  class Middleware
    attr_reader :env, :request

    def initialize(app, &block)
      raise ArgumentError, "Browser::Middleware requires a block" unless block

      @app = app
      @block = block
    end

    def call(env)
      @env = env
      @request = Rack::Request.new(env)

      path = catch(:redirected) do
        Context.new(request).instance_eval(&@block)
      end

      path ? resolve_redirection(path) : run_app!
    end

    def resolve_redirection(path)
      uri = URI.parse(path)

      if uri.path == request.path
        run_app!
      else
        redirect(path)
      end
    end

    def redirect(path)
      [301, {"Content-Type" => "text/html", "Location" => path}, []]
    end

    def run_app!
      @app.call(env)
    end
  end
end
