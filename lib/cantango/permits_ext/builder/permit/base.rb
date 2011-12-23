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

      # should be implemented by builder subclass!
      def build
        raise NotImplementedError
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
            res << permit unless permit.disabled?
          end
        rescue RuntimeError => e
          debug "Error instantiating Permit instance for #{name}, cause: #{e}"
          nil
        end
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

      def not_building
        "Not building any #{permit_type.to_s.humanize} permit"
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