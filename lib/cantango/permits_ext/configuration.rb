module CanTango
  class Configuration
    sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
      sweetload :PermitRegistry, :Permits
    end
    
    def permits
      CanTango::Configuration::Permits.instance
    end
  end
end