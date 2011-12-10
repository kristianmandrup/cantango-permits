module CanTango
  module Finder
    class Base
      include CanTango::Helpers::Debug

      attr_reader :type, :name

      def initialize name, type
        @name, @type = [name, type]
      end

      def name
        @p_name ||= @name.to_s.underscore.to_sym
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
    end
  end
end