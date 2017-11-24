# frozen_string_literal: true

module Browser
  class Base
    def alipay?(expected_version = nil)
      Alipay.new(ua).match? && detect_version?(full_version, expected_version)
    end
  end

  class Alipay < Base
    MATCH_REGEX = /AlipayClient/i
    VERSION_REGEX = %r[(?:AlipayClient)/([\d.]+)]i
    NAME = "Alipay".freeze

    def id
      :alipay
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

  matchers.unshift(Alipay)
end
