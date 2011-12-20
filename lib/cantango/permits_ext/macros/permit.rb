module CanTango
  module Permit
    class MissingTypeError < StandardError; end
    class MissingNameError < StandardError; end
  end
  
  module Macros
    module Permit
      def tango_permit options = {}
        name = options[:name] || CanTango::Macros::Permit.permit_name(self)
        account = options[:account] || CanTango::Macros::Permit.account_name(self)
        super_class = self.superclass
        class_type = unless super_class == Object
          super_class.respond_to?(:type) ? super_class.type : nil
        end
        type = options[:type] || class_type

        raise CanTango::Permit::MissingNameError, "Name of permit could not be determined, try specifying a :name option" if name.nil?
        raise CanTango::Permit::MissingTypeError, "Type of permit could not be determined, try specifying a :type option" if type.nil?

        reg_options = {:name => name, :type => type, :account => account}
        CanTango.config.permits.register self, reg_options
        reg_options
      end      
      extend CanTango::Permit::Helper::Naming
    end
  end
end

class Class
  include CanTango::Macros::Permit
end
