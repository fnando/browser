# frozen_string_literal: true

module Browser
  class Yandex < Base
    def id
      :yandex
    end

    def name
      "Yandex"
    end

    def full_version
      # Each regex on its own line to enforce precedence.
      ua[%r[YaBrowser/([\d.]+)], 1] ||
        ua[%r[Yowser/([\d.]+)], 1] ||
        ua[%r[Chrome/([\d.]+)], 1] ||
        "0.0"
    end

    def match?
      ua =~ /YaBrowser|Yowser/
    end
  end
end
