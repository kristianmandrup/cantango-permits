class CanTango::Config
  class Permits
    module Enabling
      def enable_all_for type
        @disabled ||= {}
        @disabled[type.to_sym] = nil
      end

      def enable_all!
        @disabled = {}
      end
    end
  end
end