# frozen_string_literal: true

module Browser
  class MailMaster < Base
    def id
      :mail_master
    end

    def name
      "Mail Master"
    end

    def full_version
      ua[%r{(?:MailMaster|MailMaster_Android_Mobile)/([\d.]+)}i, 1] || "0.0"
    end

    def match?
      ua =~ /MailMaster/i
    end
  end
end
