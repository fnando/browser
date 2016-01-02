module Browser
  class Firefox < Base
    def id
      :firefox
    end

    def name
      "Firefox"
    end

    def full_version
      ua[%r[Firefox/([\d.]+)], 1]
    end

    def match?
      ua =~ /Firefox/
    end
  end
end
