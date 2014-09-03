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

    def surface?
      windows_rt? && !!(ua =~ /Touch/)
    end

    # Detect if browser is tablet (currently iPad, Android, Surface or Playbook).
    def tablet?
      !!(ipad? || (android? && !detect_mobile?) || surface? || playbook?)
    end

    # Detect if browser is Kindle.
    def kindle?
      !!(ua =~ /Kindle/ || silk?)
    end

    # Detect if browser if a Blackberry Playbook tablet
    def playbook?
      !!(ua =~ /PlayBook/ && ua =~ /RIM Tablet/)
    end

    def windows_touchscreen_desktop?
      windows? && !!(ua =~ /Touch/)
    end
  end
end
