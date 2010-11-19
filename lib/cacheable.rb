$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'cacheable'))

module Cacheable
  extend self
  
  attr_accessor :cache_store
  attr_reader   :adapter

  def adapter=(mod)
    self.send :extend, mod    
  end  

end

require 'cacheable/method'
