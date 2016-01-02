module Browser
  class Device
    class KindleFire < Base
      def id
        :kindle_fire
      end

      def name
        "Kindle Fire"
      end

      def match?
        ua =~ /Kindle Fire|KFTT/
      end
    end
  end
end
