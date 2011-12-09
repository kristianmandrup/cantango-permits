module CanTango
  module Ability
    module Helper
      sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do    
        sweetload :Permits
      end
    end
  end
end
