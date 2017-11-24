# frozen_string_literal: true

module Browser
  class Weibo < Base
    MATCH_REGEX = /__weibo__/i
    VERSION_REGEX = %r[(?:__weibo__)([\d.]+)]i

    def id
      :weibo
    end

    def name
      "Weibo"
    end

    def full_version
      ua[VERSION_REGEX, 1] || "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
