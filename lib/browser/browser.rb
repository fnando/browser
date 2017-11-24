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
      MicroMessenger,
      Nokia,
      UCBrowser,
      PhantomJS,
      BlackBerry,
      Opera,
      Edge,
      InternetExplorer,
      Firefox,
      Otter,
      Facebook,             # must be placed before Chrome and Safari
      Weibo,                # must be placed before Chrome and Safari
      QQ,                   # must be placed before Chrome and Safari
      Alipay,               # must be placed before Chrome and Safari
      Electron,             # must be placed before Chrome and Safari
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
