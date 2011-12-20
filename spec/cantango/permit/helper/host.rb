module CanTango::Permit
  module Helper
    module Host
      def local_host?
        CanTango.config.localhost.registered.include? request.host
      end

      def public_host?
        !localhost?
      end
    end
  end
end