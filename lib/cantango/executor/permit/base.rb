module CanTango
  module Executor
    module Permit
      class Base < Abstract
        # execute the permit
        def execute!
          not_valid_permit and return unless permit.valid?
          permit.execute!
        end

        protected

        def subject
          permit.subject
        end

        def not_valid_permit
          debug "Permit #{permit} is not valid for #{subject}"
        end
      end
    end
  end
end