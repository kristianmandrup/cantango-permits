class CanTango::Config
  class Permits
    class Accounts
      include Singleton
            
      def registry_for name
        registries[name] ||= CanTango::Registry::Permit::Base.new
      end
      
      def registries
        @registries ||= {}
      end
    end
  end
end