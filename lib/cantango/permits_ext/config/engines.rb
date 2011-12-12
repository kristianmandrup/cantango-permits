module CanTango
  class Config
    class Engines < Registry::Hash
      sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
        sweetload :PermitEngineConfig
      end
    end
  end
end
