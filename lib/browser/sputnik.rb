# frozen_string_literal: true

module Browser
  class Sputnik < Base
    def id
      :sputnik
    end

    def name
      "Sputnik"
    end

    def full_version
      # Each regex on its own line to enforce precedence.
      ua[%r{SputnikBrowser/([\d.]+)}, 1] ||
        ua[%r{Chrome/([\d.]+)}, 1] ||
        "0.0"
    end

    def match?
      ua =~ /SputnikBrowser/
    end
  end
end
