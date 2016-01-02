class Browser
  def self.user_agents
    @user_agents ||= YAML.load_file(Browser.root.join("test/ua.yml"))
  end

  def self.[](key)
    user_agents.fetch(key)
  end
end
