require 'ra11y'

task :default => [:spec]

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  puts "Pa11y version: #{Ra11y.executable_version}"
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = ["--order", "rand", "--color"]
end
