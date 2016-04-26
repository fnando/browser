# frozen_string_literal: true
module Browser
  class Device
    class TV < Base
      def id
        :tv
      end

      DEVICE_NAME = 'TV'
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /(tv|Android.*?ADT-1|Nexus Player)/i
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
