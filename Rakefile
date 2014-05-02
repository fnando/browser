require "bundler"
require "bundler/setup"
Bundler::GemHelper.install_tasks

require "rake/testtask"
Rake::TestTask.new(:spec) do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList["test/**/*_spec.rb"]
  t.verbose = true
  t.ruby_opts = %w[-rubygems]
end

desc "Run specs against all gemfiles"
task "spec:all" do
  %w[
    Gemfile
    gemfiles/rails3.gemfile
  ].each do |gemfile|
    puts "=> Running with Gemfile: #{gemfile}"
    system "BUNDLE_GEMFILE=#{gemfile} rake spec"
  end
end

task :default => "spec"
