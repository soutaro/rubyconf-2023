require "rake/testtask"

task default: "test"

Rake::TestTask.new do |task|
  task.libs << "test"
  task.libs << "lib"
  task.pattern = "test/*_test.rb"
end
