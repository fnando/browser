require "set"
require "browser/methods/ie"
require "browser/methods/platform"
require "browser/methods/mobile"
require "browser/methods/devices"
require "browser/methods/language"

class Browser
  include IE
  include Platform
  include Mobile
  include Devices
  include Language

  # Add Rails helper if ActionController::Base is available
  require "browser/action_controller" if defined?(ActionController::Base)

  # Set browser's UA string.
  attr_accessor :user_agent
  alias :ua :user_agent
  alias :ua= :user_agent=

  NAMES = {
    :android    => "Android",
    :blackberry => "BlackBerry",
    :chrome     => "Chrome",
    :firefox    => "Firefox",
    :ie         => "Internet Explorer",
    :ipad       => "iPad",
    :iphone     => "iPhone",
    :ipod       => "iPod Touch",
    :opera      => "Opera",
    :other      => "Other",
    :safari     => "Safari",
    :psp        => "PlayStation Portable",
    :quicktime  => "QuickTime",
    :core_media => "Apple CoreMedia",
    :phantom_js => "PhantomJS"
  }

  VERSIONS = {
    :default => /(?:Version|MSIE|Firefox|Chrome|CriOS|QuickTime|BlackBerry[^\/]+|CoreMedia v|PhantomJS)[\/ ]?([a-z0-9.]+)/i,
    :opera => /Opera\/.*? Version\/([\d.]+)/
  }

  # Create a new browser instance and set
  # the UA and Accept-Language headers.
  #
  #   browser = Browser.new({
  #     :ua => "Safari",
  #     :accept_language => "pt-br"
  #   })
  #
  def initialize(options = {}, &block)
    self.user_agent = (options[:user_agent] || options[:ua]).to_s
    self.accept_language = options[:accept_language].to_s

    yield self if block_given?
  end

  # Get readable browser name.
  def name
    NAMES[id]
  end

  # Return a symbol that identifies the browser.
  def id
    case
    when chrome?      then :chrome
    when iphone?      then :iphone
    when ipad?        then :ipad
    when ipod?        then :ipod
    when ie?          then :ie
    when opera?       then :opera
    when firefox?     then :firefox
    when android?     then :android
    when blackberry?  then :blackberry
    when safari?      then :safari
    when psp?         then :psp
    when quicktime?   then :quicktime
    when core_media?  then :core_media
    when phantom_js?  then :phantom_js
    else
      :other
    end
  end

  # Return major version.
  def version
    full_version.to_s.split(".").first
  end

  # Return the full version.
  def full_version
    _, v = *ua.match(VERSIONS.fetch(id, VERSIONS[:default]))
    v || "0.0"
  end

  # Return true if browser supports some CSS 3 (Safari, Firefox, Opera & IE7+).
  def capable?
    webkit? || firefox? || opera? || (ie? && version.to_i >= 7)
  end

  # Detect if browser is WebKit-based.
  def webkit?
    !!(ua =~ /AppleWebKit/i)
  end

  # Detect if browser is QuickTime
  def quicktime?
    !!(ua =~ /QuickTime/i)
  end

  # Detect if browser is Apple CoreMedia.
  def core_media?
    !!(ua =~ /CoreMedia/)
  end

  # Detect if browser is PhantomJS
  def phantom_js?
    !!(ua =~ /PhantomJS/)
  end

  # Detect if browser is Safari.
  def safari?
    ua =~ /Safari/ && ua !~ /Chrome|CriOS|PhantomJS/
  end

  # Detect if browser is Firefox.
  def firefox?
    !!(ua =~ /Firefox/)
  end

  # Detect if browser is Chrome.
  def chrome?
    !!(ua =~ /Chrome|CriOS/)
  end

  # Detect if browser is Opera.
  def opera?
    !!(ua =~ /Opera/)
  end

  # Return a meta info about this browser.
  def meta
    set = Set.new.tap do |m|
      m << id.to_s
      m << "webkit" if webkit?
      m << "ios" if ios?
      m.merge(%W[safari safari#{version}]) if safari?
      m << "#{id}#{version}" unless safari? || chrome?
      m << platform.to_s
      m << "capable" if capable?
      m << "mobile" if mobile?
    end

    set.to_a
  end

  alias_method :to_a, :meta

  # Return meta representation as string.
  def to_s
    meta.to_a.join(" ")
  end
end
