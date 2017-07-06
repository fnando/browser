# frozen_string_literal: true

module Browser
  class OtterBrowser < Base
    def id
      :otter_browser
    end

    def name
      "Otter"
    end

    def full_version
      ua[%r[(?:Otter)/([\d.]+)]i, 1] || "0.0"
    end

    def match?
      ua =~ /Otterr/i
    end
  end
end
