module CanTango
  module Loader
    sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
      sweetload :Categories, :License
    end
  end
end
