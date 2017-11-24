# frozen_string_literal: true

module Browser
  class Alipay < Base
    MATCH_REGEX = /AlipayClient/i
    VERSION_REGEX = %r[(?:AlipayClient)/([\d.]+)]i

    def id
      :alipay
    end

    def name
      "Alipay"
    end

    def full_version
      ua[VERSION_REGEX, 1] || "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
