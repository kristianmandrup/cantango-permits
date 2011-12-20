module CanTango::Permit
  module Helper
    module Naming
      def permit_name clazz = nil
        clazz ||= is_class?(self) ? self : self.class
        return nil unless clazz.name =~ /Permit/
        namespaces = clazz.name.split('::')
        name = (namespaces[-2] == 'Permit') ? namespaces.last : namespaces.last.sub(/Permit$/, '')
        name.underscore.to_sym
      end

      def account_name clazz = nil
        clazz ||= is_class?(self) ? self : self.class
        return nil if clazz.name == clazz.name.demodulize         
        top_module = clazz.name.gsub(/::.*/,'')
        return nil unless /Permits$/ =~ top_module  
        top_module.gsub(/(.*)Permits/, '\1').underscore.to_sym
      end
      
      def permit_type clazz = nil
        clazz ||= is_class?(self) ? self : self.class
        permit_name clazz.superclass
      end

      protected

      def first_name clazz = nil
        clazz ||= is_class?(self) ? self : self.class
        clazz.to_s.gsub(/^([A-Za-z]+).*/, '\1').underscore.to_sym # first part of class name
      end
      
      def is_class? clazz
        !clazz.nil? && clazz.respond_to?(:new)
      end
    end
  end
end
