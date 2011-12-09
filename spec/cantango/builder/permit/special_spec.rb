require 'spec_helper'
require 'fixtures/models'

class MySystemPermitBuilder < CanTango::Builder::Permit::Special
end

describe CanTango::Builder::Permit::Special do
  before do
    @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
  end
  
  subject { MySystemPermitBuilder.new }
  
  describe 'attributes' do
    it "should have an ability" do
      subject.ability.should be_a(CanTango::Ability::Base)
    end
  end

  describe '#build' do
    it 'should build a permit' do
      subject.build.should be_a(CanTango::Permit::Special)
    end
  end
end
