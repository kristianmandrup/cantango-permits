module CanTango
  module Finder
    class Base
      include CanTango::Helpers::Debug

      attr_reader :type, :name

      def initialize name, options
        @name = name.to_s.underscore.to_sym 
        @type = options[:type]
        raise ArgumentError, "Missing name of permit to find" if !name
        raise ArgumentError, "Missing type of permit to find" if !type
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
      
      def registered_permits
        CanTango.config.permits
      end          
    end
  end
end