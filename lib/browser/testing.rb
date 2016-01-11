module Browser
  def self.user_agents
    @user_agents ||= browser_user_agents.merge(bot_user_agents)
  end

  def self.browser_user_agents
    @browser_user_agents ||= YAML.load_file(Browser.root.join("test/ua.yml"))
  end

  def self.bot_user_agents
    @bot_user_agents ||= YAML.load_file(Browser.root.join("test/ua_bots.yml"))
  end

  def self.[](key)
    user_agents.fetch(key)
  end
end
