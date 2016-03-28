require "bundler"
require "bundler/setup"
Bundler::GemHelper.install_tasks

require "rake/testtask"
Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
  t.warning = false
  t.ruby_opts = %w[-rubygems]
end

desc "Run specs against all gemfiles"
task "test:all" do
  %w[
    Gemfile
    gemfiles/rails3.gemfile
  ].each do |gemfile|
    puts "=> Running with Gemfile: #{gemfile}"
    system "BUNDLE_GEMFILE=#{gemfile} rake test"
  end
end

task default: "test"
