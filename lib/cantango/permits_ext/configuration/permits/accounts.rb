class CanTango::Configuration
  class Permits
    module Accounts
      attr_reader :accounts

      def accounts
        @accounts ||= Hash.new
      end

      def account_hash name
        accounts[name]
      end
    end
  end
end