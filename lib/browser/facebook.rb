module Browser
  class Facebook < Base
    def id
      :facebook
    end

    def name
      "Facebook Browser"
    end

    def full_version
      ua[%r[FBAV/([\d.]+);]i, 1] || "0.0"
    end

    def match?
      ua =~ /\bFBAN\//
    end
  end
end
