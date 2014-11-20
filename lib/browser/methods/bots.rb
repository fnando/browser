class Browser
  module Bots
    root = Pathname.new(File.expand_path("../../../..", __FILE__))
    BOTS = YAML.load_file(root.join("bots.yml"))
    SEARCH_ENGINES = YAML.load_file(root.join("search_engines.yml"))

    def self.detect_empty_ua!
      @detect_empty_ua = true
    end

    def self.detect_empty_ua?
      !!@detect_empty_ua
    end

    def bot?
      bot_with_empty_ua? || BOTS.any? {|key, _| ua.include?(key) }
    end

    def bot_name
      return unless bot?
      return "Generic Bot" if bot_with_empty_ua?
      BOTS.find {|key, description| ua.include?(key) }.first
    end

    def search_engine?
      SEARCH_ENGINES.any? {|key, _| ua.include?(key) }
    end

    private

    def bot_with_empty_ua?
      Browser::Bots.detect_empty_ua? && ua.strip == ""
    end
  end
end
