class Browser
  module Tv
    # Detect if browser is Television
    def tv?
      !!(ua =~ /(tv|Android.*?ADT-1|Nexus Player)/i)
    end
  end
end
