require 'spec_helper'

class Accounts < CanTango::Config::Permits::Accounts
  include Singleton
  
  include 
end

describe CanTango::Config::Permits::Accounts do
  subject { Accounts.new }
  
  describe 'accounts=' do
    pending
  end

  describe 'accounts' do
    pending
  end

  describe 'account_hash name' do
    pending
  end
end