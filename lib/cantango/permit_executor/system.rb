module CanTango
  class PermitExecutor
    class System < Abstract
      # always execute system permit
      def execute!
        permit?
      end
    end
  end
end

