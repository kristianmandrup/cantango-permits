module CanTango
  module Permit
    module ClassMethods
      def inherited(subclass)
        unless [CanTango::Permit::Base, CanTango::Permit::Attribute].include?(subclass.superclass)
          subclass.extend CanTango::Permit::ClassMethods
          register(subclass)
        else
          register_type subclass
        end        
      end

      def modes *names
        @modes ||= []
        return @modes if names.empty?
        @modes = names.to_symbols
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

      def register subclass, options = {}
        permits.register_permit subclass, options.merge(:account => account_name)
      end

      def register_type clazz
        CanTango.config.permits.types.register permit_name(clazz)
      end

      def permits
        CanTango.config.permits
      end
    end
  end
end

