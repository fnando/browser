class Browser
  # Add Rails helper if ActionController::Base is available
  require "browser/action_controller" if defined?(ActionController::Base)

  # Set browser's UA string.
  attr_accessor :user_agent

  # Set browser's preferred language
  attr_writer :accept_language

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
    :core_media => "Apple CoreMedia"
  }

  VERSION_REGEX = /(?:Version|MSIE|Opera|Firefox|Chrome|QuickTime|BlackBerry[^\/]+|CoreMedia v)[\/ ]?([a-z0-9.]+)/i

  LANGUAGES = {
    "af"    => "Afrikaans",
    "sq"    => "Albanian",
    "eu"    => "Basque",
    "bg"    => "Bulgarian",
    "be"    => "Byelorussian",
    "ca"    => "Catalan",
    "zh"    => "Chinese",
    "zh-cn" => "Chinese/China",
    "zh-tw" => "Chinese/Taiwan",
    "zh-hk" => "Chinese/Hong Kong",
    "zh-sg" => "Chinese/singapore",
    "hr"    => "Croatian",
    "cs"    => "Czech",
    "da"    => "Danish",
    "nl"    => "Dutch",
    "nl-nl" => "Dutch/Netherlands",
    "nl-be" => "Dutch/Belgium",
    "en"    => "English",
    "en-gb" => "English/United Kingdom",
    "en-us" => "English/United States",
    "en-au" => "English/Australian",
    "en-ca" => "English/Canada",
    "en-nz" => "English/New Zealand",
    "en-ie" => "English/Ireland",
    "en-za" => "English/South Africa",
    "en-jm" => "English/Jamaica",
    "en-bz" => "English/Belize",
    "en-tt" => "English/Trinidad",
    "et"    => "Estonian",
    "fo"    => "Faeroese",
    "fa"    => "Farsi",
    "fi"    => "Finnish",
    "fr"    => "French",
    "fr-be" => "French/Belgium",
    "fr-fr" => "French/France",
    "fr-ch" => "French/Switzerland",
    "fr-ca" => "French/Canada",
    "fr-lu" => "French/Luxembourg",
    "gd"    => "Gaelic",
    "gl"    => "Galician",
    "de"    => "German",
    "de-at" => "German/Austria",
    "de-de" => "German/Germany",
    "de-ch" => "German/Switzerland",
    "de-lu" => "German/Luxembourg",
    "de-li" => "German/Liechtenstein",
    "el"    => "Greek",
    "he"    => "Hebrew",
    "he-il" => "Hebrew/Israel",
    "hi"    => "Hindi",
    "hu"    => "Hungarian",
    "ie-ee" => "Internet Explorer/Easter Egg",
    "is"    => "Icelandic",
    "id"    => "Indonesian",
    "in"    => "Indonesian",
    "ga"    => "Irish",
    "it"    => "Italian",
    "it-ch" => "Italian/ Switzerland",
    "ja"    => "Japanese",
    "km"    => "Khmer",
    "km-kh" => "Khmer/Cambodia",
    "ko"    => "Korean",
    "lv"    => "Latvian",
    "lt"    => "Lithuanian",
    "mk"    => "Macedonian",
    "ms"    => "Malaysian",
    "mt"    => "Maltese",
    "no"    => "Norwegian",
    "pl"    => "Polish",
    "pt"    => "Portuguese",
    "pt-br" => "Portuguese/Brazil",
    "rm"    => "Rhaeto-Romanic",
    "ro"    => "Romanian",
    "ro-mo" => "Romanian/Moldavia",
    "ru"    => "Russian",
    "ru-mo" => "Russian /Moldavia",
    "gd"    => "Scots Gaelic",
    "sr"    => "Serbian",
    "sk"    => "Slovack",
    "sl"    => "Slovenian",
    "sb"    => "Sorbian",
    "es"    => "Spanish",
    "es-do" => "Spanish",
    "es-ar" => "Spanish/Argentina",
    "es-co" => "Spanish/Colombia",
    "es-mx" => "Spanish/Mexico",
    "es-es" => "Spanish/Spain",
    "es-gt" => "Spanish/Guatemala",
    "es-cr" => "Spanish/Costa Rica",
    "es-pa" => "Spanish/Panama",
    "es-ve" => "Spanish/Venezuela",
    "es-pe" => "Spanish/Peru",
    "es-ec" => "Spanish/Ecuador",
    "es-cl" => "Spanish/Chile",
    "es-uy" => "Spanish/Uruguay",
    "es-py" => "Spanish/Paraguay",
    "es-bo" => "Spanish/Bolivia",
    "es-sv" => "Spanish/El salvador",
    "es-hn" => "Spanish/Honduras",
    "es-ni" => "Spanish/Nicaragua",
    "es-pr" => "Spanish/Puerto Rico",
    "sx"    => "Sutu",
    "sv"    => "Swedish",
    "sv-se" => "Swedish/Sweden",
    "sv-fi" => "Swedish/Finland",
    "ts"    => "Thai",
    "tn"    => "Tswana",
    "tr"    => "Turkish",
    "uk"    => "Ukrainian",
    "ur"    => "Urdu",
    "vi"    => "Vietnamese",
    "xh"    => "Xshosa",
    "ji"    => "Yiddish",
    "zu"    => "Zulu"
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
    @user_agent = (options[:user_agent] || options[:ua]).to_s
    @accept_language = options[:accept_language].to_s

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
    else
      :other
    end
  end

  # Return an array with all preferred languages that this browser accepts.
  def accept_language
    @accept_language.gsub(/;q=[\d.]+/, "").split(",").collect {|l| l.downcase.gsub(/\s/m, "")}
  end

  # Return major version.
  def version
    full_version.to_s.split(".").first
  end

  # Return the full version.
  def full_version
    _, v = *ua.match(VERSION_REGEX)
    v || "0.0"
  end

  # Return true if browser supports some CSS 3 (Safari, Firefox, Opera & IE7+).
  def capable?
    webkit? || firefox? || opera? || (ie? && version >= "7")
  end

  # Detect if browser is WebKit-based.
  def webkit?
    !!(ua =~ /AppleWebKit/i)
  end

  # Detect if browser is ios?.
  def ios?
    ipod? || ipad? || iphone?
  end

  # Detect if browser is mobile.
  def mobile?
    !!(ua =~ /(Mobile|Symbian|MIDP|Windows CE)/) || blackberry? || psp?
  end

  # Detect if browser is QuickTime
  def quicktime?
    !!(ua =~ /QuickTime/i)
  end

  # Detect if browser is BlackBerry
  def blackberry?
    !!(ua =~ /BlackBerry/)
  end

  # Detect if browser is Android.
  def android?
    !!(ua =~ /Android/)
  end

  # Detect if browser is Apple CoreMedia.
  def core_media?
    !!(ua =~ /CoreMedia/)
  end

  # Detect if browser is iPhone.
  def iphone?
    !!(ua =~ /iPhone/)
  end

  # Detect if browser is iPad.
  def ipad?
    !!(ua =~ /iPad/)
  end

  # Detect if browser is iPod.
  def ipod?
    !!(ua =~ /iPod/)
  end

  # Detect if browser is Safari.
  def safari?
    ua =~ /Safari/ && ua !~ /Chrome/
  end

  # Detect if browser is Firefox.
  def firefox?
    !!(ua =~ /Firefox/)
  end

  # Detect if browser is Chrome.
  def chrome?
    !!(ua =~ /Chrome/)
  end

  # Detect if browser is Internet Explorer.
  def ie?
    !!(ua =~ /MSIE/ && ua !~ /Opera/)
  end

  # Detect if browser is Internet Explorer 6.
  def ie6?
    ie? && version == "6"
  end

  # Detect if browser is Internet Explorer 7.
  def ie7?
    ie? && version == "7"
  end

  # Detect if browser is Internet Explorer 8.
  def ie8?
    ie? && version == "8"
  end

  # Detect if browser is Internet Explorer 9.
  def ie9?
    ie? && version == "9"
  end

  # Detect if browser is running from PSP.
  def psp?
    !!(ua =~ /PSP/)
  end

  # Detect if browser is Opera.
  def opera?
    !!(ua =~ /Opera/)
  end

  # Detect if current platform is Macintosh.
  def mac?
    !!(ua =~ /Mac OS X/)
  end

  # Detect if current platform is Windows.
  def windows?
    !!(ua =~ /Windows/)
  end

  # Detect if current platform is Linux flavor.
  def linux?
    !!(ua =~ /Linux/)
  end

  # Return the platform.
  def platform
    case
    when linux?   then :linux
    when mac?     then :mac
    when windows? then :windows
    else
      :other
    end
  end

  # Return a meta info about this browser.
  def meta
    Array.new.tap do |m|
      m << id
      m << "webkit" if webkit?
      m << "ios" if ios?
      m << "safari safari#{version}" if safari?
      m << "#{id}#{version}" unless safari? || chrome?
      m << platform
      m << "capable" if capable?
      m << "mobile" if mobile?
    end
  end

  # Return meta representation as string.
  def to_s
    meta.join(" ")
  end
end
