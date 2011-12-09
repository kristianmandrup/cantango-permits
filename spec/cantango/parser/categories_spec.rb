require 'spec_helper'

describe CanTango::Parser::Categories do
  before do
    @categories = {}
    @key = :grains
    @models = ['Wheat', 'Barley']
  end

  subject { CanTango::Parser::Categories.new }
  
  describe 'parse categories, key, obj, &blk' do
    specify do
      subject.parse @categories, @key, @models do |categories|
        categories[@key].should == @models
      end
    end
  end
end
