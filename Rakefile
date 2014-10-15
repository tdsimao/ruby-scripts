require 'rake/testtask'
require 'minitest/spec'

task :default => :test

Rake::TestTask.new do |t|
	t.libs << "tests"
	t.test_files = FileList['tests/test*.rb']
	t.verbose = false
end
