class Browser
  module Bots
    BOTS = YAML.load_file(File.expand_path("../../../../bots.yml", __FILE__))

    def bot?
      ua.empty? || BOTS.any? {|key, description| ua.include?(key) }
    end

    def bot_name
      return nil unless bot?
      BOTS.detect { |key, description| ua.include? key }[0]
    end
  end
end
