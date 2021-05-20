# frozen_string_literal: true

module Browser
  class YahooMobileApp < Base
    def id
      :yahoo_app
    end

    def name
      "Yahoo Mobile App"
    end

    def full_version
      ua[%r{appli/([\d.]+)}, 1] ||
        "0.0"
    end

    def match?
      ua.include?("YJApp")
    end
  end
end
