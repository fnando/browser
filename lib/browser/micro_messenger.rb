# frozen_string_literal: true

module Browser
  class MicroMessenger < Base
    VERSION_REGEX = %r[(?:MicroMessenger)/([\d.]+)]i
    MATCH_REGEX = /MicroMessenger/i

    def id
      :micro_messenger
    end

    def name
      "MicroMessenger"
    end

    def full_version
      ua[VERSION_REGEX, 1] || "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
