module CanTango
  class Configuration
    class Engines < HashRegistry
      autoload_modules :PermitEngineConfig
    end
  end
end
