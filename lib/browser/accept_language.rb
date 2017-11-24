# frozen_string_literal: true

module Browser
  class AcceptLanguage
    CODE_REGEX = /\A([^-;]+)/
    REGION_REGEX = /\A(?:.*?)-([^;-]+)/
    DEFAULT_QUALITY_VALUE = "0.0".freeze
    QUALITY_VALUE_REGEX = /;q=([\d.]+)/
    ZERO_VALUE = /\A0\.0?\z/
    DOT_REGEX = /\.+/

    def self.languages
      @languages ||= begin
        require "yaml"
        YAML.load_file(Browser.root.join("languages.yml"))
      end
    end

    def self.parse(accept_language)
      return [] unless accept_language

      accept_language
        .split(COMMA)
        .map {|string| string.squeeze(SPACE).strip }
        .map {|part| new(part) }
        .reject {|al| al.quality.zero? }
        .sort_by(&:quality)
        .reverse
    end

    attr_reader :part

    def initialize(part)
      @part = part
    end

    def full
      @full ||= [code, region].compact.join(HYPHEN)
    end

    def name
      self.class.languages[full] || self.class.languages[code]
    end

    def code
      @code ||= begin
        code = part[CODE_REGEX, 1]
        code.downcase if code
      end
    end

    def region
      @region ||= begin
        region = part[REGION_REGEX, 1]
        region.upcase if region
      end
    end

    def quality
      @quality ||= begin
        Float(quality_value || 1.0)
      rescue ArgumentError
        0.1
      end
    end

    private

    def quality_value
      qvalue = part[QUALITY_VALUE_REGEX, 1]
      qvalue = qvalue =~ ZERO_VALUE ? DEFAULT_QUALITY_VALUE : qvalue
      qvalue = qvalue.gsub(DOT_REGEX, DOT) if qvalue
      qvalue
    end
  end
end
