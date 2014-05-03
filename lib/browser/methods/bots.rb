class Browser
  module Bots
    BOTS = YAML.load_file(File.expand_path("../../../../bots.yml", __FILE__))

    def bot?
      ua.empty? || BOTS.any? {|key, _| ua.include?(key) }
    end
  end
end
