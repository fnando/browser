# frozen_string_literal: true
module Browser
  class Bot
    def self.detect_empty_ua!
      @detect_empty_ua = true
    end

    def self.detect_empty_ua?
      @detect_empty_ua
    end

    def self.bots
      @bots ||= YAML.load_file(preferred_path("bots.yml"))
    end

    def self.bot_exceptions
      @bot_exceptions ||= YAML
                          .load_file(preferred_path("bot_exceptions.yml"))
    end

    def self.search_engines
      @search_engines ||= YAML
                          .load_file(preferred_path("search_engines.yml"))
    end

    attr_reader :ua

    def initialize(ua)
      @ua = ua
    end

    def bot?
      bot_with_empty_ua? || (!bot_exception? && detect_bot?)
    end

    def search_engine?
      self.class.search_engines.any? {|key, _| downcased_ua.include?(key) }
    end

    def name
      return unless bot?
      return "Generic Bot" if bot_with_empty_ua?
      self.class.bots.find {|key, _| downcased_ua.include?(key) }.last
    end

    private

    def bot_with_empty_ua?
      self.class.detect_empty_ua? && ua.strip == ""
    end

    def bot_exception?
      self.class.bot_exceptions.any? {|key| downcased_ua.include?(key) }
    end

    def detect_bot?
      self.class.bots.any? {|key, _| downcased_ua.include?(key) }
    end

    def downcased_ua
      @downcased_ua ||= ua.downcase
    end

    def self.preferred_path(filename)
      lookup_paths(filename).find {|path| File.exist?(path) }
    end
    private_class_method :preferred_path

    def self.lookup_paths(filename)
      # in order of priority
      base_paths = []
      base_paths << Rails.root if defined?(Rails)
      base_paths << Browser.root

      base_paths.map {|bp| bp.join(filename) }
    end
    private_class_method :lookup_paths
  end
end
