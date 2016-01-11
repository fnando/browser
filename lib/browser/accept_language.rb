module Browser
  class AcceptLanguage
    def self.languages
      @languages ||= YAML.load_file(Browser.root.join("languages.yml"))
    end

    def self.parse(accept_language)
      return [] unless accept_language

      accept_language
        .split(",")
        .map {|string| string.squeeze(" ").strip }
        .map {|part| new(part) }
        .sort_by(&:quality)
        .reverse
    end

    attr_reader :part

    def initialize(part)
      @part = part
    end

    def full
      @full ||= [code, region].compact.join("-")
    end

    def name
      self.class.languages[full] || self.class.languages[code]
    end

    def code
      @code ||= part[/\A([^-;]+)/, 1]
    end

    def region
      @region ||= begin
        region = part[/\A(?:.*?)-([^;-]+)/, 1]
        region.upcase if region
      end
    end

    def quality
      @quality ||= Float(part[/;q=([\d.]+)/, 1] || 1.0)
    end
  end
end
