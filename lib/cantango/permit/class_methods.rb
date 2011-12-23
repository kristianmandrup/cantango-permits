module CanTango
  module Permit
    module ClassMethods
      def inherited(subclass)
        unless subclass.superclass == CanTango::Permit::Base
          subclass.extend CanTango::Permit::ClassMethods
          register(subclass)
        else
          CanTango.config.permits.types.register permit_name(subclass)
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

      def permits
        CanTango.config.permits
      end
    end
  end
end

