class Browser
  module Devices
    # Detect if browser is iPhone.
    def iphone?
      !!(ua =~ /iPhone/)
    end

    # Detect if browser is iPad.
    def ipad?
      !!(ua =~ /iPad/)
    end

    # Detect if browser is iPod.
    def ipod?
      !!(ua =~ /iPod/)
    end

    # Detect if browser is tablet (currently just iPad or Android).
    def tablet?
      !!(ipad? || (android? && !detect_mobile?))
    end

    # Detect if browser is Kindle.
    def kindle?
      !!(ua =~ /Kindle/)
    end

    # Detect if browser is running from PSP.
    def psp?
      !!(ua =~ /PSP/)
    end
  end
end
