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

    # Detect if browser is tablet (currently just iPad, Android or Playbook).
    def tablet?
      !!(ipad? || (android? && !detect_mobile?) || playbook?)
    end

    # Detect if browser is Kindle.
    def kindle?
      !!(ua =~ /Kindle/)
    end

    # Detect if browser is running from PSP.
    def psp?
      !!(ua =~ /PSP/)
    end
    
    # Detect if browser if a Blackberry Playbook tablet
    def playbook?
      !!(ua =~ /PlayBook/ and ua =~ /RIM Tablet/)
    end
  end
end
