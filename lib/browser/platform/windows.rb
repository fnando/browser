module Browser
  class Platform
    class Windows < Base
      def version
        "0"
      end

      def name
        "Windows"
      end

      def id
        :windows
      end

      def match?
        ua =~ /Windows/
      end
    end
  end
end
