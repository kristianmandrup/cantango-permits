module CanTango::Permit
  module Helper
    module Host
      def local_host?
        CanTango.config.localhosts.registered.include? request.host
      end

      def public_host?
        !local_host?
      end
    end
  end
end
