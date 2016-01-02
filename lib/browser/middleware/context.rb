module Browser
  class Middleware
    class Context
      attr_reader :browser, :request

      def initialize(request)
        @request = request

        @browser = Browser.new(
          request.user_agent,
          request.env["HTTP_ACCEPT_LANGUAGE"]
        )
      end

      def redirect_to(path)
        throw :redirected, path.to_s
      end
    end
  end
end
