module Browser
  class Device
    class Ipad < Base
      def id
        :ipad
      end

      def name
        "iPad"
      end

      def match?
        ua =~ /iPad/
      end
    end
  end
end
