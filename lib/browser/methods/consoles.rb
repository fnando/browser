class Browser
  module Consoles
    # Detect if browser is Xbox.
    def xbox?
      !!(ua =~ /xbox/i)
    end

    # Detect if browser is PlayStation.
    def playstation?
      !!(ua =~ /playstation/i)
    end

    # Detect if browser is Nintendo.
    def nintendo?
      !!(ua =~ /nintendo/i)
    end

    # Detect if browser is console (currently Xbox, PlayStation, or Nintendo).
    def console?
      xbox? || playstation? || nintendo?
    end
  end
end
