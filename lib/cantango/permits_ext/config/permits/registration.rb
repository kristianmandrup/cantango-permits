class CanTango::Config
  class Permits
    module Registration
      include CanTango::Permit::Helper::Naming
      
      def register_permit clazz, options = {}
        register clazz, options
      end

      def register_permit_type clazz, options = {}
        types.register permit_name(clazz), clazz
      end
      
      def register permit_clazz, options = {}
        permit_name = options[:name]    || permit_name(permit_clazz)
        permit_type = options[:type]    || permit_type(permit_clazz)
        acc_name    = options[:account] || (permit_clazz.account_name if permit_clazz.respond_to?(:account_name))

        registry = acc_name ? accounts.registry_for(acc_name) : self
        
        unless registry
          raise acc_name ? "Missing Permit account Registry for #{acc_name}" : "Missing Permit Registry for #{self}"
        end 
                
        acc_debug = acc_name ? "(#{acc_name})" : ''
        debug "Registering #{permit_type} permit: #{permit_name} of class #{permit_clazz} #{acc_debug}"

        permit_registry = registry.registry_for(permit_type)
        permit_registry.register permit_name => permit_clazz        
      end
    end
  end
end