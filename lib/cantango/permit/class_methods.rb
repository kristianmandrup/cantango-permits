module CanTango
  module Permit
    module ClassMethods
      def inherited(subclass)
        register subclass
      end

      def type
        :abstract
      end

      def hash_key
        raise NotImplementedError
      end

      def find_permit
        finder.get_permit
      end

      def finder
        @finder ||= CanTango::Finder::Permit.new permit_name(self), account_name(self)
      end

      def build_permit ability, name
        builder(ability, finder).create_permit name
      end

      def builder ability, finder
        @builder ||= CanTango::Builder::Permit.new ability, finder
      end

      protected

      include CanTango::Permit::Helper::Naming

      def register subclass
        available_permits[permit_name(subclass)] = subclass
      end

      def available_permits
        CanTango.config.permits.available_permits
      end
    end
  end
end

