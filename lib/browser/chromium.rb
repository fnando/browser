# frozen_string_literal: true
module Browser
  class Chromium < Base
    def id
      :chromium
    end

    def name
      "Chromium"
    end

    def full_version
      # Each regex on its own line to enforce precedence.
      ua[%r[Chrome/([\d.]+)], 1] ||
        ua[%r[CriOS/([\d.]+)], 1] ||
        ua[%r[Safari/([\d.]+)], 1] ||
        ua[%r[AppleWebKit/([\d.]+)], 1] ||
        "0.0"
    end

    def match?
      ua =~ /Chrome|CriOS/ && !edge?
    end
  end
end
