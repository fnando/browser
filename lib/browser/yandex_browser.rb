# frozen_string_literal: true

module Browser
  class YandexBrowser < Base
    def id
      :yandex_browser
    end

    def name
      "Yandex Browser"
    end

    def full_version
      ua[%r[YaBrowser/([\d.]+)], 1] || "0.0"
    end

    def match?
      ua =~ /YaBrowser/
    end
  end
end
