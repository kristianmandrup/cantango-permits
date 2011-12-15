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
        account_name = options[:account_name] || account_name(permit_clazz)

        registry = account_name ? self.send(account_name.to_sym) : self
        debug "Registering #{permit_type} permit: #{permit_name} of class #{permit_clazz}"

        registry.get(permit_type)[permit_name] = permit_clazz
        # debug registry.get(permit_type).inspect
      end
    end
  end
end