# frozen_string_literal: true

module Browser
  class Base
    def weibo?(expected_version = nil)
      Weibo.new(ua).match? && detect_version?(full_version, expected_version)
    end
  end

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

  matchers.unshift(Weibo)
end
