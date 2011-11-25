module CanTango
  module Executor
    class Base
      def execute!
        raise NotImplementedError
      end
    end
  end
end