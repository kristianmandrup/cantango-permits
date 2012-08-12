puts "Ability"

module CanTango
  module Ability
    sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do    
      sweetload :Helper
    end
  end
end
