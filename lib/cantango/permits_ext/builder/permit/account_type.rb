module CanTango
  module Builder::Permit
    class AccountType < Base
      # builds a list of Permits for each role of the current ability user (or account)
      # @return [Array<RoleGroupPermit::Base>] the role permits built for this ability
      def build
        return [] if !account
        super
      end
    end
  end
end

