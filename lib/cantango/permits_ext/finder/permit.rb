module CanTango::Finder
  module Permit
    sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
      sweetload :Base, :Account
    end
  end
end
