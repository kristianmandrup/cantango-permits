module CanTango
  class Ability
    module Helper
      module Permits
        def permits?
          config.permits.on?
        end
      end
    end
  end
end

