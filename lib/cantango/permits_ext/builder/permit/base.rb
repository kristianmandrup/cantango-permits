module CanTango
  module Builder::Permit
    class Base
      class CreatePermitError < StandardError; end

      include CanTango::Helpers::Debug

      attr_accessor :ability, :options

      # creates the factory for the ability
      # note that the ability contains the roles and role groups of the user (or account)
      # @param [Permits::Ability] the ability
      def initialize ability, options = {}
        @ability, @options = [ability, options]
      end

      module ClassMethods
        include CanTango::Permit::Helper::Naming
      end
      extend ClassMethods

      def permit_type
        self.class.permit_name
      end

      # builds a list of Permits for each role of the current ability user (or account)
      # @return [Array<Permit::Base>] the role permits built for this ability
      def build
        debug debug_msg
        permits
      end

      protected

      # Tries to create a new permit
      # If no permit Class can be found, it should return nil
      # @param [Symbol] the name
      # @return the permit Class or nil if not found
      def create_permits
        begin
          names.inject([]) do |res, name|
            permit = permit(name)
            res << permit if valid?(permit)
            res
          end
        rescue RuntimeError => e
          debug "Error instantiating Permit instance for #{name}, cause: #{e}"
          nil
        end
      end

      def valid? permit
        return false if permit.disabled?
        permit.valid? 
      end

      def debug_msg
        permits ? msg(:building) : msg(:not_building)
      end

      def permits
        @permit ||= create_permits
      end

      def permit name
        clazz = permit_class(name)
        permit = clazz.new ability if clazz
      end

      def names
        CanTango.config.permits.registered_for(permit_type).registered_names
      end

      def finder name
        CanTango::Finder::Permit::Base.new name, options.merge(:type => permit_type)
      end

      def permit_class name
        finder(name).find_permit
      end

      def msg type
        type == :building ? "Building #{htype} permits" : "Not building any #{htype} permits"
      end

      def htype
        permit_type.to_s.humanize
      end

      # delegate to ability
      [:options, :subject, :user, :user_account].each do |name|
        define_method name do
          ability.send(name)
        end
      end
    end
  end
end