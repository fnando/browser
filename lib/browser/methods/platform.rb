class Browser
  module Platform
    # Detect if browser is Android.
    def android?
      !!(ua =~ /Android/ && !opera?)
    end

    # Detect if browser is ios?.
    def ios?
      ipod? || ipad? || iphone?
    end

    # Detect if is iOS5.
    def ios4?
      ios? && !!(ua =~ /OS (4)/)
    end

    # Detect if is iOS5.
    def ios5?
      ios? && !!(ua =~ /OS (5)/)
    end

    # Detect if is iOS6.
    def ios6?
      ios? && !!(ua =~ /OS (6)/)
    end

    # Detect if current platform is Macintosh.
    def mac?
      !!(ua =~ /Mac OS X/)
    end

    # Detect if current platform is Windows.
    def windows?
      !!(ua =~ /Windows/)
    end

    # Detect if current platform is Linux flavor.
    def linux?
      !!(ua =~ /Linux/)
    end

    # Return the platform.
    def platform
      case
      when linux?   then :linux
      when mac?     then :mac
      when windows? then :windows
      else
        :other
      end
    end
  end
end
