require "rake/testtask"
require "rake/rdoctask"
require "./lib/browser/version"

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
  t.ruby_opts = %w[-rubygems]
end

Rake::RDocTask.new do |rdoc|
  rdoc.main = "README.rdoc"
  rdoc.rdoc_dir = "doc"
  rdoc.title = "Browser API"
  rdoc.options += %w[ --line-numbers --inline-source --charset utf-8 ]
  rdoc.rdoc_files.include("README.rdoc")
  rdoc.rdoc_files.include("lib/**/*.rb")
end

begin
  require "jeweler"

  Jeweler::Tasks.new do |gem|
    gem.name = "browser"
    gem.email = "fnando.vieira@gmail.com"
    gem.homepage = "http://github.com/fnando/browser"
    gem.authors = ["Nando Vieira"]
    gem.version = Browser::Version::STRING
    gem.summary = "Do some browser detection with Ruby."
    gem.files =  FileList["README.rdoc", "{lib,test}/**/*", "Rakefile"]
  end

  Jeweler::GemcutterTasks.new
rescue LoadError => e
  puts "You need to install jeweler to build this gem."
end
