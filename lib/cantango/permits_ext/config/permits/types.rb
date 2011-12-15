class CanTango::Config
  class Permits
    class Types < CanTango::Registry::Base
      include Singleton

      attr_writer :enabled

      def available
        registered
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