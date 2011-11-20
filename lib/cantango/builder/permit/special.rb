module CanTango
  module Builder::Permit
    class Special < Base
      def build
        special_permits.map{|name| create_permit(name)}.compact
      end

      def special_permits
        [:system, :any]
      end
    end
  end
end
