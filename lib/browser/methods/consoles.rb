class Browser
  module Consoles
    # Detect if browser is running under Xbox.
    def xbox?
      !!(ua =~ /xbox/i)
    end

    # Detect if browser is running under Xbox One.
    def xbox_one?
      !!(ua =~ /xbox one/i)
    end

    # Detect if browser is running under PlayStation.
    def playstation?
      !!(ua =~ /playstation/i)
    end

    # Detect if browser is running under PlayStation 4.
    def playstation4?
      !!(ua =~ /playstation 4/i)
    end

    # Detect if browser is Nintendo.
    def nintendo?
      !!(ua =~ /nintendo/i)
    end

    # Detect if browser is console (currently Xbox, PlayStation, or Nintendo).
    def console?
      xbox? || playstation? || nintendo?
    end

    # Detect if browser is running from PSP.
    def psp?
      !!(ua =~ /(PSP)/ || psp_vita?)
    end

    # Detect if browser is running from PSP Vita.
    def psp_vita?
      !!(ua =~ /Playstation Vita/)
    end
  end
end
