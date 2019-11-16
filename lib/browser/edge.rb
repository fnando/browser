# frozen_string_literal: true

module Browser
  class Edge < InternetExplorer
    def id
      :edge
    end

    def name
      "Microsoft Edge"
    end

    def full_version
      ua[%r[(?:Edge|Edg)/([\d.]+)], 1] || super
    end

    def match?
      ua =~ %r[((?:Edge|Edg)/[\d.]+|Trident/8)]
    end

    def chrome_based?
      match? && ua =~ /\bEdg\b/
    end
  end
end
