# frozen_string_literal: true

require "browser/meta/proxy"
require "browser/nokia"
require "browser/uc_browser"

module Browser
  class Base
    # Detect if browser is a proxy browser.
    def proxy?
      nokia? || uc_browser? || opera_mini?
    end
  end
end
