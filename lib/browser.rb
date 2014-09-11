require "set"
require "yaml"
require "pathname"

require "browser/middleware"
require "browser/middleware/context"
require "browser/rails" if defined?(::Rails)

require "browser/methods/ie"
require "browser/methods/platform"
require "browser/methods/mobile"
require "browser/methods/devices"
require "browser/methods/consoles"
require "browser/methods/language"
require "browser/methods/bots"
require "browser/methods/tv"

require "browser/meta/base"
require "browser/meta/generic_browser"
require "browser/meta/id"
require "browser/meta/ie"
require "browser/meta/ios"
require "browser/meta/mobile"
require "browser/meta/modern"
require "browser/meta/platform"
require "browser/meta/safari"
require "browser/meta/webkit"

class Browser
  include IE
  include Platform
  include Mobile
  include Devices
  include Consoles
  include Language
  include Bots
  include Tv

  # Set browser's UA string.
  attr_accessor :user_agent
  alias_method :ua, :user_agent
  alias_method :ua=, :user_agent=

  NAMES = {
    chrome: "Chrome", # Must come before android
    android: "Android",
    blackberry: "BlackBerry",
    core_media: "Apple CoreMedia",
    firefox: "Firefox",
    ie: "Internet Explorer",
    ipad: "iPad",
    iphone: "iPhone",
    ipod: "iPod Touch",
    nintendo: "Nintendo",
    opera: "Opera",
    phantom_js: "PhantomJS",
    psp: "PlayStation Portable",
    playstation: "PlayStation",
    quicktime: "QuickTime",
    safari: "Safari",
    xbox: "Xbox",

    # This must be last item, since Ruby 1.9+ has ordered keys.
    other: "Other",
  }

  VERSIONS = {
    chrome: %r[(?:Chrome|CriOS)/([\d.]+)],
    default: %r[(?:Version|MSIE|Firefox|QuickTime|BlackBerry[^/]+|CoreMedia v|PhantomJS)[/ ]?([a-z0-9.]+)]i,
    opera: %r[(?:Opera/.*? Version/([\d.]+)|Chrome/([\d.]+).*?OPR)],
    ie: %r[(?:MSIE |Trident/.*?; rv:)([\d.]+)]
  }

  # Define the rules which define a modern browser.
  # A rule must be a proc/lambda or any object that implements the method
  # === and accepts the browser object.
  #
  # To redefine all rules, clear the existing rules before adding your own.
  #
  #   # Only Chrome Canary is considered modern.
  #   Browser.modern_rules.clear
  #   Browser.modern_rules << -> b { b.chrome? && b.version >= '37' }
  #
  def self.modern_rules
    @modern_rules ||= []
  end

  self.modern_rules.tap do |rules|
    rules << -> b { b.webkit? }
    rules << -> b { b.firefox? && b.version.to_i >= 17 }
    rules << -> b { b.ie? && b.version.to_i >= 9 }
    rules << -> b { b.opera? && b.version.to_i >= 12 }
    rules << -> b { b.firefox? && b.tablet? && b.android? && b.version.to_i >= 14 }
  end

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

    yield self if block
  end

  # Get readable browser name.
  def name
    NAMES[id]
  end

  # Get the browser identifier.
  def id
    NAMES.keys
      .find {|id| respond_to?("#{id}?") ? public_send("#{id}?") : id }
  end

  # Return major version.
  def version
    full_version.to_s.split(".").first
  end

  # Return the full version.
  def full_version
    _, *v = *ua.match(VERSIONS.fetch(id, VERSIONS[:default]))
    v.compact.first || "0.0"
  end

  # Return true if browser is modern (Webkit, Firefox 17+, IE9+, Opera 12+).
  def modern?
    self.class.modern_rules.any? {|rule| rule === self }
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
    ua =~ /Safari/ && ua !~ /Android|Chrome|CriOS|PhantomJS/
  end

  # Detect if browser is Firefox.
  def firefox?
    !!(ua =~ /Firefox/)
  end

  # Detect if browser is Chrome.
  def chrome?
    !!(ua =~ /Chrome|CriOS/) && !opera?
  end

  # Detect if browser is Opera.
  def opera?
    !!(ua =~ /(Opera|OPR)/)
  end

  # Detect if browser is Silk.
  def silk?
    !!(ua =~ /Silk/)
  end

  # Return a meta info about this browser.
  def meta
    Meta.constants.each_with_object(Set.new) do |meta_name, meta|
      meta_class = Meta.const_get(meta_name)
      meta.merge(meta_class.new(self).to_a)
    end.to_a
  end

  alias_method :to_a, :meta

  # Return meta representation as string.
  def to_s
    meta.to_a.join(" ")
  end
end
