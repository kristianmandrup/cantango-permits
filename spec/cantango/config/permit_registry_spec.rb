require 'spec_helper'

require 'cantango/config/permit_registry_ex'

describe CanTango::Config::Permits::Registration do
  subject { CanTango::Config::Permits.instance }

  it_should_behave_like CanTango::Config::Permits::Registration
end