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
      Browser::Bots.detect_empty_ua? && ua.strip == "" || BOTS.any? {|key, _| ua.include?(key) }
    end

    def search_engine?
      SEARCH_ENGINES.any? {|key, _| ua.include?(key) }
    end
  end
end
