module CanTango
  module Executor
    module Permit
      class Base < Abstract
        # execute the permit
        def execute!
          not_valid_permit and return if !valid_permit?
          permit.execute!
        end

        protected

        def valid_permit?
          permit.valid_for?(subject) if permit
        end

        def not_valid_permit
          debug "Permit #{permit} is not valid for #{subject}"
        end
      end
    end
  end
end