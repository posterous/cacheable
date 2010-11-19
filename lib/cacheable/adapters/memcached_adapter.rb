module Cacheable
  module MemcachedAdapter
    def get key
      Cacheable.cache_store.get key
    rescue
      nil
    end

    def set key, value
      Cacheable.cache_store.set key, value
    end
  end
end
