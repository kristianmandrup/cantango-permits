module CanTango
  module Permit
    module ClassMethods
      def inherited(subclass)
        register subclass
        subclass.extend CanTango::Permit::ClassMethods
      end

      def type
        :abstract
      end

      def hash_key
        raise NotImplementedError
      end

      def finder
        @finder ||= CanTango::Finder::Permit::Base.new permit_name(self), :account => account_name(self)
      end

      protected

      include CanTango::Permit::Helper::Naming

      def register subclass
        available_permits[permit_name(subclass)] = subclass
      end

      def available_permits
        CanTango.config.permits.available
      end
    end
  end
end

