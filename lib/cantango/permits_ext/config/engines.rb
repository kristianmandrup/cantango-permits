module CanTango
  class Config
    class Engines
      sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
        sweetload :Permit
      end
    end
  end
end
