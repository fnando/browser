# frozen_string_literal: true

module Browser
  class Instagram < Base
    def id
      :instagram
    end

    def name
      "Instagram"
    end

    def full_version
      ua[%r[Instagram ([\d.]+)], 1]
    end

    def match?
      ua =~ /Instagram/
    end
  end
end
