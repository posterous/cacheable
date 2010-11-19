module Cacheable
  module Method
    module ClassMethods
    
      def caches method
        build_cache_methods method
      end

      def build_cache_methods method

        base_method_name = 'cached_' + method.to_s

        define_method base_method_name do |*args|
          key         = "#{self.cache_key}/#{method}/#{args.to_s}"
          from_cache  = Cacheable.get(key)
          
          return from_cache unless from_cache.nil?
            
          to_cache = self.send(method,*args)
          Cacheable.set(key,to_cache)

          to_cache
        end

        define_method base_method_name + '!' do |*args|
          key         = "#{self.cache_key}/#{method}/#{args.to_s}"
          to_cache    = self.send(method,*args)

          Cacheable.set(key,nil)
          Cacheable.set(key,to_cache)

          to_cache
        end
      end

    end

    def self.included(receiver)
      receiver.extend ClassMethods
    end
  end
end
