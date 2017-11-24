# frozen_string_literal: true

module Browser
  class Device
    class BlackBerryPlaybook < Base
      MATCH_REGEX = /PlayBook.*?RIM Tablet/

      def id
        :playbook
      end

      def name
        "BlackBerry Playbook"
      end

      def match?
        browser.ua =~ MATCH_REGEX
      end
    end
  end
end
