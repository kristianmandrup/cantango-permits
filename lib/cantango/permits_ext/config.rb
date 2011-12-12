module CanTango
  class Config
    sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
      sweetload :Permits
    end
    
    def permits
      CanTango::Config::Permits.instance
    end
  end
end