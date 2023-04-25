# frozen_string_literal: true

module Browser
  class Bot
    GENERIC_NAME = "Generic Bot"
    BOT_EXCEPTION_FILE = "bot_exceptions.yml"

    def self.matchers
      @matchers ||= default_matchers
    end

    def self.default_matchers
      [
        EmptyUserAgentMatcher,
        KnownBotsMatcher,
        KeywordMatcher
      ]
    end

    def self.load_yaml(path, base_path: Browser.root)
      return unless base_path.join(path).exist?

      YAML.load_file(base_path.join(path))
    end

    def self.bots
      @bots ||= load_yaml("bots.yml")
    end

    def self.bot_exceptions
      @bot_exceptions ||= begin
        exceptions = load_yaml(BOT_EXCEPTION_FILE)
        app_exceptions = load_yaml(BOT_EXCEPTION_FILE,
                                   base_path: Browser.app_path) || []

        exceptions + app_exceptions
      end
    end

    def self.search_engines
      @search_engines ||= load_yaml("search_engines.yml")
    end

    def self.why?(ua)
      ua = ua.downcase.strip
      browser = Browser.new(ua)
      matchers.find {|matcher| matcher.call(ua, browser) }
    end

    attr_reader :ua, :browser

    def initialize(ua)
      @ua = ua.downcase.strip
      @browser = Browser.new(@ua)
    end

    def bot?
      !bot_exception? && detect_bot?
    end

    def why?
      self.class.matchers.find {|matcher| matcher.call(ua, self) }
    end

    def search_engine?
      self.class.search_engines.any? {|key, _| ua.include?(key) }
    end

    def name
      return unless bot?

      self.class.bots.find {|key, _| ua.include?(key) }&.last || GENERIC_NAME
    end

    private def bot_exception?
      self.class.bot_exceptions.any? {|key| ua.include?(key) }
    end

    private def detect_bot?
      self.class.matchers.any? {|matcher| matcher.call(ua, browser) }
    end

    private :ua
    private :browser
  end
end
