class Browser
  module Bots
    root = Pathname.new(File.expand_path("../../../..", __FILE__))
    BOTS = YAML.load_file(root.join("bots.yml"))
    SEARCH_ENGINES = YAML.load_file(root.join("search_engines.yml"))

    def self.detect_empty_ua!
      Browser::Bots::BOTS[''] = 'Generic bot'
    end

    def bot?
      BOTS.any? {|key, _| ua.include?(key) }
    end

    def search_engine?
      SEARCH_ENGINES.any? {|key, _| ua.include?(key) }
    end
  end
end
