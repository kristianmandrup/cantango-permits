class CanTango::Configuration
  class Permits
    module Enabling
      def enable_all_for type
        @disabled ||= {}
        @disabled[type.to_sym] = nil
      end

      def enable_all!
        @disabled = {}
        enable_all_types!
      end
    end
  end
end