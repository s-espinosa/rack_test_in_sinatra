require "bundler"
Bundler.require

require "sinatra/activerecord/rake"
require 'rake/testtask'

task :test do
  Dir.glob('./test/**/*_test.rb') { |file| require file }
end
