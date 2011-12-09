module CanTango::Ability::Helper
  module Permits
    def permits?
      CanTango.config.permits.on?
    end
  end
end

