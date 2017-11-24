# frozen_string_literal: true

module Browser
  module Meta
    class IE < Base
      IE_LT_8 = "oldie lt-ie8 lt-ie9".freeze
      IE_EQ_8 = "lt-ie9".freeze

      def version
        @version ||= browser.version.to_i
      end

      def meta
        return unless browser.ie?

        meta = []
        meta << IE_LT_8 if version < 8
        meta << IE_EQ_8 if version == 8
        meta.join(SPACE)
      end
    end
  end
end
