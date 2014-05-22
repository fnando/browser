class Browser
  module Mobile
    # Detect if browser is mobile.
    def mobile?
      detect_mobile? && !tablet?
    end

    # Detect if browser is Opera Mini.
    def opera_mini?
      !!(ua =~ /Opera Mini/)
    end

    # Detect if browser is BlackBerry
    def blackberry?
      !!(ua =~ /(BlackBerry)/)
    end

    private

    def detect_mobile?
      ua =~ /(Mobi(le)?|Symbian|MIDP|Windows CE)/ || blackberry? || psp? || opera_mini?
    end
  end
end
