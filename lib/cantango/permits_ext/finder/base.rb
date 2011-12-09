module CanTango
  module Finder
    class Base
      include CanTango::Helpers::Debug

      attr_reader :type, :name

      def initialize name, options = {}
        @type = options[:type]
        @name = name.to_s.underscore.to_sym
      end

      def permit
        debug permit_msg(found_permit)
        found_permit
      end

      protected

      def permit_msg
        found_permit.nil? ? "no #{type} permits found named #{name}" : "#{type} permit found named: #{name} -> #{found_permit}"
      end

      def permits
        registered_permits.registered_for(type)
      end
      
      def permit_class
        "Permit::#{name.to_s.camelize}"
      end
    end
  end
end