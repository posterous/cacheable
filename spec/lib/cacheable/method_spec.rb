require 'spec_helper'

class Faker
  include Cacheable::Method

  caches :awesomeness

  def cache_key
    'faker/1'
  end

  def awesomeness
    p 'called'
    "so awesome"
  end

end

Cacheable.cache_store = CACHE
Cacheable.adapter     = Cacheable::MemcachedAdapter
Cacheable.cache_store.flush

describe Cacheable::Method do

  before { @faker = Faker.new }

  describe "#caches" do
    subject { @faker }
    it { should respond_to :cached_awesomeness }
  end

  describe "#cached_awesomeness" do
    subject { @faker.cached_awesomeness }
    it { should == 'so awesome' }
    it { should == 'so awesome' }
  end

  describe "#cached_awesomeness!" do
    subject { @faker.cached_awesomeness! }
    it { should == 'so awesome' }
  end


end

