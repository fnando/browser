require "bundler"
Bundler::GemHelper.install_tasks

require "rake/testtask"
Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
  t.ruby_opts = %w[-rubygems]
end

desc "Run specs against all gemfiles"
task "test:all" do
  %w[
    Gemfile
    gemfiles/rails3.gemfile
  ].each do |gemfile|
    ENV["BUNDLE_GEMFILE"] = gemfile
    puts "=> Running with Gemfile: #{gemfile}"
    Rake::Task["test"].reenable
    Rake::Task["test"].invoke
  end
end

task :default => "test"
