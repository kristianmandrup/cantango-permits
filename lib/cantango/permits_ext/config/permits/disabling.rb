class CanTango::Config
  class Permits
    module Disabling
      def disable_for type, *names
        @disabled ||= {}
        @disabled[type.to_sym] = names.to_symbols
      end

      def disabled
        @disabled ||= {}
      end

      def disabled? type, *names
        (names.flatten - disabled_for(type)).empty?
      end

      def disabled_for type
        disabled[type.to_sym] || []
      end
    end
  end
end