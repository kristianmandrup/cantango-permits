require 'spec_helper'
require 'fixtures/models'

class MyLicensePermit < CanTango::Ability::Base
  include CanTango::Permit::Helper::License
end

class BloggingLicense < CanTango::License
  def initialize ability
    super
  end
  
  def calc_rules
    can :edit, Project
  end
end

describe CanTango::Permit::Helper::License do
  before do
    @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
  end
  subject { MyLicense.new @user }

  describe 'license name' do
    before do
      subject.license(:blogging)
    end
    specify { subject.rules.should_not be_empty }
  end

  describe 'licenses *names' do
    before do
      subject.licenses(:blogging)
    end
    specify { subject.rules.should_not be_empty }
  end
end