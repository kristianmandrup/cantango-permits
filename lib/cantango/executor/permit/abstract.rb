module CanTango
  module Executor
    module Permit
      class Abstract
        include CanTango::Helpers::Debug

        attr_accessor :permit

        def initialize permit
          @permit = permit
        end

        def execute!
          permit.execute! if permit
        end

        protected
        
        delegate :subject, :to => :permit

        def valid_for? subject
          permit.valid_for?(subject) if permit
        end
      end
    end
  end
end
