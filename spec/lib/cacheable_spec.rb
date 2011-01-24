require 'spec_helper'

describe Cacheable do

  describe "#cache_store" do
    before { Cacheable.cache_store = CACHE }
    subject { Cacheable.cache_store }
    it { should be_a Memcached }
  end

  describe "#adapter" do
    before { Cacheable.adapter = Cacheable::MemcachedAdapter }
    subject { Cacheable }
    it { should respond_to :get }
    it { should respond_to :set }
    it { should respond_to :foo }
  end

end
