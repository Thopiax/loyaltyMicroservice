# Get all test case files
Dir["./test/**/tc_*.rb"].each {|file| require file}
