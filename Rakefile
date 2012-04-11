require "bundler"
Bundler::GemHelper.install_tasks

require "./lib/browser/version"

require "rake/testtask"
Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
  t.ruby_opts = %w[-rubygems]
end

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  rdoc.main = "README.rdoc"
  rdoc.rdoc_dir = "doc"
  rdoc.title = "Browser API"
  rdoc.options += %w[ --line-numbers --charset utf-8 ]
  rdoc.rdoc_files.include("README.rdoc", "lib/**/*.rb")
end

task :default => :test