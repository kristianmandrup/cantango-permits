module CanTango
  class PermitExecutor < PermitExecutor::Base
    autoload_modules :Base, :System

    # execute the permit
    def execute!
      valid_for?(subject) ? permit? : not_candidate_permit
    end

    protected

    def not_candidate_permit
      debug "Permit #{permit} is not valid for #{subject}"
    end
  end
end
