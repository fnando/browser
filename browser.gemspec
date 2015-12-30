# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "browser/version"

Gem::Specification.new do |s|
  s.name        = "browser"
  s.version     = Browser::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nando Vieira"]
  s.email       = ["fnando.vieira@gmail.com"]
  s.homepage    = "http://github.com/fnando/browser"
  s.summary     = "Do some browser detection with Ruby."
  s.description = s.summary
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.post_install_message = [
    "",
    "#################### WARNING ##############################"     ,
    "#                                                         #"     ,
    "#   Internet Explorer detection has changed on v1.0.0+.   #"     ,
    "#   If this is important for you, please read             #"     ,
    "#   https://github.com/fnando/browser#internet-explorer   #"     ,
    "#                                                         #"     ,
    "#   iOS webviews and web apps aren't detect as Safari     #"     ,
    "#   anymore, so be aware of that if that's your case.     #"     ,
    "#                                                         #"     ,
    "###########################################################"     ,
    "\n"
  ].join("\n")

  s.add_development_dependency "bundler", ">= 0"
  s.add_development_dependency "rake"
  s.add_development_dependency "rails"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "minitest"
  s.add_development_dependency "minitest-utils"
  s.add_development_dependency "pry-meta"
  s.add_development_dependency "minitest-autotest"
end
