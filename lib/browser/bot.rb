# frozen_string_literal: true

module Browser
  class Base
    # Return the bot info.
    def bot
      @bot ||= Bot.new(self)
    end

    # Detect if current user agent is from a bot.
    def bot?
      bot.bot?
    end
  end

  class Bot
    DEFAULT_NAME = "Generic Bot".freeze

    def self.allow_empty_ua!
      @allow_empty_ua = true
    end

    def self.disallow_empty_ua!
      @allow_empty_ua = false
    end

    def self.allow_empty_ua?
      @allow_empty_ua
    end

    def self.bots
      @bots ||= begin
        require "yaml"
        YAML.load_file(Browser.root.join("bots.yml"))
      end
    end

    def self.bot_exceptions
      @bot_exceptions ||= YAML
                          .load_file(Browser.root.join("bot_exceptions.yml"))
    end

    def self.search_engines
      @search_engines ||= YAML
                          .load_file(Browser.root.join("search_engines.yml"))
    end

    attr_reader :browser

    def initialize(browser)
      @browser = browser
    end

    def bot?
      return if allow_empty_ua?
      return if bot_exception?

      browser.ua.empty? || detect_bot? || unknown?
    end

    def search_engine?
      self.class.search_engines.any? {|key, _| downcased_ua.include?(key) }
    end

    def name
      return unless bot?

      _, name = self.class.bots.find {|key, _| downcased_ua.include?(key) }

      name || DEFAULT_NAME
    end

    private

    def allow_empty_ua?
      self.class.allow_empty_ua? && browser.ua.empty?
    end

    def bot_exception?
      self.class.bot_exceptions.any? {|key| downcased_ua.include?(key) }
    end

    def detect_bot?
      self.class.bots.any? {|key, _| downcased_ua.include?(key) }
    end

    def downcased_ua
      @downcased_ua ||= browser.ua.downcase
    end

    def unknown?
      browser.device.unknown? && browser.platform.other?
    end
  end
end
