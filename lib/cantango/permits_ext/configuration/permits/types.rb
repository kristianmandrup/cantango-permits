class CanTango::Configuration
  class Permits
    class Types 
      include Singleton
      include CanTango::Registry::Base

      attr_writer :enabled

      def available
        available.keys
      end

      def enabled
        @enabled || available
      end

      def disable *types
        @enabled = available - registered.flatten
      end

      def enable_all!
        @enabled = available
      end
    end
  end
end