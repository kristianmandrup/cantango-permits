module CanTango
  class Engine
    sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
      sweetload :Permits
    end
  end
end