# frozen_string_literal: true

module Browser
  class Snapchat < Base
    def id
      :snapchat
    end

    def name
      "Snapchat"
    end

    def full_version
      ua[%r[Snapchat( ?|/)([\d.]+)], 2]
    end

    def match?
      ua =~ /Snapchat/
    end
  end
end
