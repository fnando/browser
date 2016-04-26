# frozen_string_literal: true
module Browser
  class Device
    class BlackBerryPlaybook < Base
      def id
        :playbook
      end

      DEVICE_NAME = 'BlackBerry Playbook'
      def name
        DEVICE_NAME
      end

      MATCH_REGEX = /PlayBook.*?RIM Tablet/
      def match?
        ua =~ MATCH_REGEX
      end
    end
  end
end
