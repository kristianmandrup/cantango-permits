class CanTango::Config
  class Permits
    module Disabling
      def disable_for type, *names
        @disabled ||= {}
        @disabled[type.to_sym] = names.flatten.select_labels.map{|n| n.to_s.underscore}
      end

      def disabled
        @disabled ||= {}
      end

      def disabled_for type
        disabled[type]
      end
    end
  end
end