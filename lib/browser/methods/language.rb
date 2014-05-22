class Browser
  module Language
    LANGUAGES = YAML.load_file(File.expand_path("../../../../languages.yml", __FILE__))

    # Set browser's preferred language
    attr_writer :accept_language

    # Return an array with all preferred languages that this browser accepts.
    def accept_language
      @accept_language
        .gsub(/;q=[\d.]+/, "")
        .split(",")
        .map {|l| l.downcase.gsub(/\s/m, "") }
    end
  end
end
