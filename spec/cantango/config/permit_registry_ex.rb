require 'spec_helper'

shared_examples_for CanTango::Config::Permits::Registration do
  it "#get_registry_for should work for default permit types" do
    [:user_type, :account_type, :role, :role_group].each do |type|
      subject.get_registry_for(type).should_not be_nil 
    end
  end
end