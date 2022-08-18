# frozen_string_literal: true

module Browser
  class DingTalkBrowser < Base
    def id
      :ding_talk_browser
    end

    def name
      "DingTalkBrowser"
    end

    def full_version
      ua[%r{DingTalk/([\d.]+)}, 1] || "0.0"
    end

    def chromium_based?
      true
    end

    def match?
      ua.match?(/DingTalk/)
    end
  end
end
