module CanTango::Permit
  module Helper
    module Naming
      def permit_name clazz = nil
        clazz ||= self if is_class?(self)
        raise ArgumentError, "Must take a Class as an argument, was: #{clazz}" unless is_class?(clazz)
        namespaces = clazz.name.split('::')
        name = (namespaces[-2] == 'Permit') ? namespaces.last : namespaces.last.sub(/Permit$/, '')
        name.underscore.to_sym
      end

      def account_name clazz = nil
        clazz ||= self if is_class?(self)
        raise ArgumentError, "Must take a Class as an argument, was: #{clazz}" unless is_class?(clazz)

        return nil if clazz.name == clazz.name.demodulize         
        top_module = clazz.name.gsub(/::.*/,'')
        return nil unless /Permits$/ =~ top_module  
        top_module.gsub(/(.*)Permits/, '\1').underscore.to_sym
      end
      
      def permit_type clazz = nil
        clazz ||= self if is_class?(self)
        raise ArgumentError, "Must take a Class as an argument, was: #{clazz}" unless is_class?(clazz)

        permit_name clazz.superclass
      end

      protected

      def first_name clazz = nil
        clazz ||= self if is_class?(self)
        raise ArgumentError, "Must take a Class as an argument, was: #{clazz}" unless is_class?(clazz)

        clazz.to_s.gsub(/^([A-Za-z]+).*/, '\1').underscore.to_sym # first part of class name
      end
      
      def is_class? clazz
        !clazz.nil? && clazz.respond_to?(:new)
      end
    end
  end
end
