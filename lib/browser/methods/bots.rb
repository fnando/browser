class Browser
  module Bots
    def self.bots
      @bots ||= YAML.load_file(Browser.root.join("bots.yml"))
    end

    def self.bot_exceptions
      @bot_exceptions ||= YAML.load_file(Browser.root.join("bot_exceptions.yml"))
    end

    def self.search_engines
      @search_engines ||= YAML.load_file(Browser.root.join("search_engines.yml"))
    end

    def self.detect_empty_ua!
      @detect_empty_ua = true
    end

    def self.detect_empty_ua?
      !!@detect_empty_ua
    end

    def bot?
      bot_with_empty_ua? || (!bot_exception? && detect_bot?)
    end

    def bot_name
      return unless bot?
      return "Generic Bot" if bot_with_empty_ua?
      Browser::Bots.bots.find {|key, _| ua.include?(key) }.first
    end

    def search_engine?
      Browser::Bots.search_engines.any? {|key, _| ua.include?(key) }
    end

    private

    def bot_with_empty_ua?
      Browser::Bots.detect_empty_ua? && ua.strip == ""
    end

    def bot_exception?
      Browser::Bots.bot_exceptions.any? {|key| ua.include?(key) }
    end

    def detect_bot?
      Browser::Bots.bots.any? {|key, _| ua.include?(key) }
    end
  end
end
