module CanTango
  module Builder::Permit
    class UserType < Base
      # class NoAvailableRoles < StandardError; end

      def initialize ability, options = {}
        super
      end

      # builds a list of Permits for each role of the current ability user (or account)
      # @return [Array<Permit::Base>] the role permits built for this ability
      def build
        debug debug_msg
        permits
      end

      protected

      def debug_msg
        permits ? "Building UserPermit permits" : not_building
      end

      def permits
        @permit ||= create_permits
      end
    end
  end
end

