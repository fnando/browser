class Browser
  module Proxy
    # Detect if browser is a proxy browser
    def proxy?
      nokia? || uc_browser? || opera_mini?
    end
  end
end
