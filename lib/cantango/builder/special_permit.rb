module CanTango
  module Builder
    class SpecialPermit < Permit
      def build
        special_permits.map{|name| create_permit(name)}.compact
      end

      def special_permits
        [:system, :any]
      end
    end
  end
end
