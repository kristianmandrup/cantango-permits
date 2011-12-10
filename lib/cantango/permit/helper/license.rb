module CanTango::Permit
  module Helper
    module License
      def licenses *names
        names.to_strings.each do |name|
          try_license name
        end
      end

      def license name
        raise ArgumentError, "Argument must be a single label" if !name.kind_of_label?
        licenses name
      end

      protected

      def license_const name        
        license_class(name).constantize
      rescue NameError
        raise "License #{license_class(name)} is not defined"
      end
      
      def license_class name 
        "#{name.camelize}License"
      end

      def try_license name
        license_const(name).new(self).calc_rules
      rescue Exception => e
        raise "License #{license_const(name)} could not be executed: #{e}"
      end
    end
  end
end
