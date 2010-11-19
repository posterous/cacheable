
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'spec'
require 'spec/autorun'
require 'cacheable'
require 'cacheable/adapters/memcached_adapter'

require 'rubygems'
require 'memcached'

Spec::Runner.configure do |config|
  config.mock_with :mocha
end

CACHE = Memcached.new(['127.0.0.1:11211', '127.0.0.1:11211'])

