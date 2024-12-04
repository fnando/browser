# frozen_string_literal: true

module Browser
  class Epiphany < Base
    def id
      :epiphany
    end

    def name
      "Epiphany"
    end

    def full_version
      ua[%r{Epiphany/([\d.]+)}, 1] || "0.0"
    end

    def match?
      ua.include?("Epiphany")
    end
  end
end
