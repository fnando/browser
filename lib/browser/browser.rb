# frozen_string_literal: true

module Browser
  EMPTY_STRING = "".freeze

  def self.root
    @root ||= begin
      require "pathname"
      Pathname.new(File.expand_path("../../..", __FILE__))
    end
  end

  # Hold the list of browser matchers.
  # Order is important.
  def self.matchers
    @matchers ||= [
      Edge,
      InternetExplorer,
      Firefox,
      Opera,
      Chrome,
      Safari,
      Generic
    ]
  end

  def self.new(user_agent, **kwargs)
    matchers
      .map {|klass| klass.new(user_agent || EMPTY_STRING, **kwargs) }
      .find(&:match?)
  end
end
