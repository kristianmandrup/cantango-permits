module CanTango
  module Factory
    class Permits
      include CanTango::Helpers::Debug

      attr_accessor :ability
      attr_reader :type

      # creates the factory for the ability
      # note that the ability contains the roles and role groups of the user (or account)
      # @param [Permits::Ability] the ability
      def initialize ability, type
        @ability, @type = [ability, type]
      end

      def create
        permits.build
      end

      def permits
        permits_builder.new ability
      end
      
      def permits_builder
        permits_builder_class.constantize
      end

      def permits_builder_class
        return "CanTango::Builder::Permit::Special" if type == :special
        "CanTango::Builder::Permit::#{type.to_s.camelize}"
      end

      protected

      def enabled_permit_types
        CanTango.config.permits.types.enabled
      end
    end
  end
end