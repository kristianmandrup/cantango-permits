require 'spec_helper'
require 'cantango/configuration/permit_registry_ex'

describe CanTango::Config::PermitRegistry do
  subject { CanTango::Config::Permits.instance }

  it_should_behave_like CanTango::Config::PermitRegistry
end