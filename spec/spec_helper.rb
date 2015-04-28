require 'molflow'

require 'bundler'
Bundler.setup
Bundler.require(:test)

require 'rspec/support/spec'
require 'mocha/setup'

if ENV['COVERAGE']
  require 'simplecov'

  SimpleCov.start do
    add_filter '/spec/'
    add_filter '/bin/'
  end
end

RSpec.configure do |config|
  config.mock_with :mocha

  config.after(:all) do
    FileUtils.rm_rf(Dir.glob("#{Molflow.root}/tmp"))
  end
end