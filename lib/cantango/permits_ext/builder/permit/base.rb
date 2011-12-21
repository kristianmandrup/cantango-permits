module CanTango
  module Builder::Permit
    class Base
      class CreatePermitError < StandardError; end

      include CanTango::Helpers::Debug

      attr_accessor :ability, :finder

      # creates the factory for the ability
      # note that the ability contains the roles and role groups of the user (or account)
      # @param [Permits::Ability] the ability
      def initialize ability, finder
        @ability = ability
        @finder = finder
      end

      def self.permit_type
        self.name.demodulize.gsub(/Permit/, '').gsub(/(.*)(Builder)/, '\1').underscore.to_sym
      end

      def permit_type
        self.class.permit_type
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
      def create_permit name
        begin
          permit_class(name).new ability
        rescue RuntimeError => e
          # puts "Error instantiating Permit instance for #{name}, cause: #{e}" if CanTango.debug?
          nil
        end
      end

      def permit_class name
        finder.find_permit
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