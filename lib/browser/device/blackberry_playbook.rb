# frozen_string_literal: true

module Browser
  class Device
    class BlackBerryPlaybook < Base
      def id
        :playbook
      end

      def name
        "BlackBerry Playbook"
      end

      def match?
        browser.ua =~ /PlayBook.*?RIM Tablet/
      end
    end
  end
end
