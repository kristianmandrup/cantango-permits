module CanTango::Permit
  module Helper
    module Naming
      def permit_name clazz
        namespaces = clazz.name.split('::')
        name = (namespaces[-2] == 'Permit') ? namespaces.last : namespaces.last.sub(/Permit$/, '')
        name.underscore.to_sym
      end

      def account_name clazz
        return nil if clazz.name == clazz.name.demodulize
        clazz.name.gsub(/::.*/,'').gsub(/(.*)Permits/, '\1').underscore.to_sym
      end
      
      def permit_type clazz
        permit_name clazz.superclass
      end

      protected

      def first_name clazz
        clazz.to_s.gsub(/^([A-Za-z]+).*/, '\1').underscore.to_sym # first part of class name
      end
    end
  end
end
