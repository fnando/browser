# frozen_string_literal: true
module Browser
  class Platform
    class Windows < Base
      VERSION_MAP = {
        "10.0" => "10",
        "6.3"  => "8.1",
        "6.2"  => "8",
        "6.1"  => "7",
        "6.0"  => "Vista",
        "5.2"  => "XP x64 Edition",
        "5.1"  => "XP",
        "5.01" => "2000, Service Pack 1 (SP1)",
        "5.0"  => "2000",
        "4.0"  => "NT 4.0",
        "98"   => "98",
        "95"   => "95",
      }.freeze

      def version
        nt_version = ua[/Windows(?:\sNT)?\s*([0-9_\.]+)?/, 1]
        VERSION_MAP[nt_version] || "0"
      end

      def name
        "Windows"
      end

      def id
        :windows
      end

      def match?
        ua =~ /Windows/
      end
    end
  end
end
