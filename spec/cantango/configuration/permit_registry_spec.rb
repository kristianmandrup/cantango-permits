require 'spec_helper'
require 'cantango/configuration/permit_registry_ex'

describe CanTango::Configuration::PermitRegistry do
  subject { CanTango::Configuration::Permits.instance }

  it_should_behave_like CanTango::Configuration::PermitRegistry
end