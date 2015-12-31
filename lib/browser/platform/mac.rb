class Browser
  class Platform
    class Mac < Base
      def version
        "0"
      end

      def name
        "Macintosh"
      end

      def id
        :mac
      end

      def match?
        ua =~ /Mac/
      end
    end
  end
end
