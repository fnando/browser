# frozen_string_literal: true

module Browser
  class WeworkBrowser < Base
    def id
      :wework_browser
    end

    def name
      "WeworkBrowser"
    end

    def full_version
      ua[%r{wxwork/([\d.]+)}, 1] || "0.0"
    end

    def match?
      ua.match?(/wxwork/)
    end
  end
end
