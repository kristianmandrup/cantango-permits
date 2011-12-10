module CanTango::Permit
  module Helper
    module State
      def disable!
        @enabled = false
      end

      def disabled?
        !enabled?
      end

      def enable!
        @enabled = true
      end

      def enabled?
        @enabled == true
      end
    end
  end
end