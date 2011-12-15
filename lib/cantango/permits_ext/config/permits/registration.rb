class CanTango::Config
  class Permits
    module Registration
      include CanTango::Permit::Helper::Naming
      
      def register_permit clazz, options = {}
        register clazz, clazz.superclass, options
      end

      def register_permit_type clazz, options = {}
        types.register permit_name(clazz), clazz
      end
      
      def register permit_clazz, base_clazz, options = {}
        permit_name = options[:permit_name] || permit_name(permit_clazz)
        permit_type = options[:permit_type] || permit_type(permit_clazz)
        acc_name = options[:account_name] || (permit_clazz.account_name if permit_clazz.respond_to? :account_name)

        puts "acc_name: #{acc_name}"
        registry = acc_name ? account_for(acc_name) : self
        debug "Registering #{permit_type} permit: #{permit_name} of class #{permit_clazz}"

        permit_registry = registry.permit_registry_for(permit_type)
        permit_registry[permit_name] = permit_clazz
      end
    end
  end
end