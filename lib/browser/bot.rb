# frozen_string_literal: true

module Browser
  class Bot
    GENERIC_NAME = "Generic Bot"

    def self.bot_list_matcher
      lambda do |ua|
        bots.any? {|key, _| ua.include?(key) }
      end
    end

    def self.empty_ua_matcher
      lambda do |ua|
        detect_empty_ua? && ua == ""
      end
    end

    def self.matchers
      @matchers ||= [
        empty_ua_matcher,
        bot_list_matcher
      ]
    end

    def self.detect_empty_ua!
      @detect_empty_ua = true
    end

    def self.detect_empty_ua?
      @detect_empty_ua
    end

    def self.bots
      @bots ||= YAML.load_file(Browser.root.join("bots.yml"))
    end

    def self.bot_exceptions
      @bot_exceptions ||= YAML
                          .load_file(Browser.root.join("bot_exceptions.yml"))
    end

    def self.search_engines
      @search_engines ||= YAML
                          .load_file(Browser.root.join("search_engines.yml"))
    end

    def self.why?(ua)
      ua = ua.downcase.strip
      bots.find {|key, _| ua.include?(key) }
    end

    attr_reader :ua

    def initialize(ua)
      @ua = ua.downcase.strip
    end

    def bot?
      !bot_exception? && detect_bot?
    end

    def search_engine?
      self.class.search_engines.any? {|key, _| ua.include?(key) }
    end

    def name
      return unless bot?
      return GENERIC_NAME if ua == ""

      self.class.bots.find {|key, _| ua.include?(key) }&.last || GENERIC_NAME
    end

    private def bot_exception?
      self.class.bot_exceptions.any? {|key| ua.include?(key) }
    end

    private def detect_bot?
      self.class.matchers.any? {|matcher| matcher.call(ua) }
    end
  end
end
