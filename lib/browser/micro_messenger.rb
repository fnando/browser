# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is MicroMessenger.
    def micro_messenger?(expected_version = nil)
      MicroMessenger.new(ua).match? &&
        detect_version?(full_version, expected_version)
    end
    alias_method :wechat?, :micro_messenger?
  end

  class MicroMessenger < Base
    VERSION_REGEX = %r[(?:MicroMessenger)/([\d.]+)]i
    MATCH_REGEX = /MicroMessenger/i
    NAME = "MicroMessenger".freeze

    def id
      :micro_messenger
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

  matchers.unshift(MicroMessenger)
end
