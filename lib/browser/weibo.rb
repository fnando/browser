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
    NAME = "Weibo".freeze

    def id
      :weibo
    end

    def name
      NAME
    end

    def full_version
      ua[VERSION_REGEX, 1] || DEFAULT_FULL_VERSION
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end

  matchers.unshift(Weibo)
end
