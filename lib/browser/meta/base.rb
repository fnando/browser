# frozen_string_literal: true

require "set"

module Browser
  module Meta
    def self.rules
      @rules ||= [
        GenericBrowser,
        Id,
        IE,
        Proxy,
        Safari,
        Webkit
      ]
    end

    def self.get(browser)
      rules.each_with_object(Set.new) do |rule, meta|
        meta.merge(rule.new(browser).to_a)
      end.to_a
    end

    class Base
      # Set the browser instance.
      attr_reader :browser

      def initialize(browser)
        @browser = browser
      end

      def meta
        nil
      end

      def to_a
        meta.to_s.squeeze(" ").split(" ")
      end
    end
  end
end
