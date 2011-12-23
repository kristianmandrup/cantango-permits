module CanTango
  module Executor
    module Permit
      class Base < Abstract
        # execute the permit
        def execute!
          not_valid_permit and return unless permit.valid?
          super
        end

        protected

        def not_valid_permit
          debug "Permit #{permit} is not valid for #{subject}"
        end
      end
    end
  end
end