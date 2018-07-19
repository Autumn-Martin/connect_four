require "rake"
require "rake/testtask"

Rake::TestTask.new do |t| # giving Rake a new task: find all the test files & run them
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
end

task default: :test
