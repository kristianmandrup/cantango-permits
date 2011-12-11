class CanTango::Configuration
  class Permits
    module Registration
      def register_permit clazz, options = {}
      end

      def register_permit_type clazz, options = {}
      end
      
      def register permit_clazz, base_clazz, options = {}
        permit_name = options[:permit_name] || base_clazz.permit_name(permit_clazz)
        permit_type = options[:permit_type] || base_clazz.type
        account_name = options[:account_name] || base_clazz.account_name(permit_clazz)

        registry = account_name ? self.send(account_name.to_sym) : self
        debug "Registering #{permit_type} permit: #{permit_name} of class #{permit_clazz}"

        registry.get(permit_type)[permit_name] = permit_clazz
        # debug registry.get(permit_type).inspect
      end
    end
  end
end