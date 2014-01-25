class Browser
  module Meta
    class IE < Base
      def version
        @version ||= browser.version.to_i
      end

      def meta
        return unless browser.ie?

        meta = ""
        meta << "oldie lt-ie8 lt-ie9" if version < 8
        meta << "lt-ie9" if version == 8
        meta
      end
    end
  end
end
