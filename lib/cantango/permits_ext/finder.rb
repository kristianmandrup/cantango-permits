module CanTango
  module Finder
    sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
      sweetload :Base, :Permit
    end
  end
end
