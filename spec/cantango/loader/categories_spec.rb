require 'spec_helper'

describe CanTango::Loader::Categories do
  before do
    @file = File.join(config_path, 'categories.yml')
  end

  subject { CanTango::Loader::Categories.new }

  context 'categories loaded via default setting' do
    describe 'categories' do
      specify do 
        subject.categories.default.should_not be_empty
      end
    end

    describe 'category name' do
      specify do 
        subject.category(:grains).should == []
      end
    end
  end
  
  subject { CanTango::Loader::Categories.new @file }
  
  describe 'parser' do
    specify { subject.parser.should be_a CanTango::Parser::Categories }
  end
  
  context 'categories registered in config' do
    before do
      CanTango.config.categories.register :genders => ['male', 'female'] 
    end
    
    describe 'categories' do
      specify do 
        subject.categories.default.genders.should == ['male', 'female']
      end
    end

    describe 'category name' do
      specify do 
        subject.category(:genders).should == ['male', 'female']
      end
    end
  end
end