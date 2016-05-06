# frozen_string_literal: true
module Browser
  class Weibo < Base
    def id
      :weibo
    end

    def name
      "Weibo"
    end

    # use version of Weibo client instead of the underlaying webview
    #   because this bitch disabled js so must be treated as diffrent browser
    def full_version
      ua[%r[(?:__weibo__)([\d.]+)]i, 1] || "0.0"
    end

    def match?
      ua =~ /__weibo__/i
    end
  end
end
