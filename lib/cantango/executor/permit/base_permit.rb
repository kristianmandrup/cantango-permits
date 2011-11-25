module CanTango
  module Executor
    class BasePermit
      autoload_modules :Base, :Special
      
      include CanTango::Helpers::Debug

      attr_accessor :permit

      def initialize permit
        @permit = permit
      end

      def execute!
        permit.execute! if permit
      end

      protected

      def valid_for? subject
        permit.valid_for?(subject) if permit
      end
    end
  end
end

