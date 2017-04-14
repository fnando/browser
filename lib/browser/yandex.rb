# frozen_string_literal: true
module Browser
  class Yandex < Chromium
    def id
      :yandex
    end

    def name
      "Yandex"
    end

    def match?
      ua =~ /YaBrowser/
    end
  end
end
