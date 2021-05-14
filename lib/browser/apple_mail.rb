# frozen_string_literal: true

module Browser
  class AppleMail < Base
    def id
      :apple_mail
    end

    def name
      "Apple Mail"
    end

    def full_version
      "0.0" # The user agent does not specify any version
    end

    def match?
      ua.include?("AppleWebKit") && !safari? && !device.playstation_vita? && !platform.adobe_air?
    end
  end
end
