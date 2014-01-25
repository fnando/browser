require "uri"

class Browser
  class Middleware
    # Detect the most common assets.
    ASSETS_REGEX = %r[\.(css|png|jpe?g|gif|js|svg|ico|flv|mov|m4v|ogg|swf)\z]i

    def initialize(app, &block)
      raise ArgumentError, "Browser::Middleware requires a block" unless block

      @app = app
      @block = block
    end

    def call(env)
      request = Rack::Request.new(env)

      # Only apply verification on HTML requests.
      # This ensures that images, CSS and JavaScript
      # will be rendered.
      return run_app(env) unless html?(request)

      path = catch(:redirected) do
        Context.new(request).instance_eval(&@block)
      end

      # No path, no match.
      return run_app(env) unless path

      resolve_redirection(env, request.path, path)
    end

    def resolve_redirection(env, current_path, path)
      uri = URI.parse(path)

      if uri.path == current_path
        run_app(env)
      else
        redirect(path)
      end
    end

    def redirect(path)
      [302, {"Content-Type" => "text/html", "Location" => path}, []]
    end

    def run_app(env)
      @app.call(env)
    end

    def html?(request)
      return if request.path.match(ASSETS_REGEX)
      request.env["HTTP_ACCEPT"].to_s.include?("text/html")
    end
  end
end
