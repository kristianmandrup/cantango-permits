require 'spec_helper'
require 'fixtures/models'

class MyPermit < CanTango::Permit::Base
  include CanTango::Permit::Helper::Host
end

class RequestHost
  attr_accessor :host
  
  def initialize host
    @host = host
  end
end

describe CanTango::Permit::Helper::Naming do  
  before do
    @localhost_req = RequestHost.new 'localhost'
    @user = SimpleUser.new
    @ability = CanTango::Ability::Base.new @user, :request => @localhost_req
  end
  
  subject { MyPermit.new @ability }  
  
  context 'localhost' do
    specify { subject.local_host?.should be_true }
    specify { subject.public_host?.should be_false }
  end
end