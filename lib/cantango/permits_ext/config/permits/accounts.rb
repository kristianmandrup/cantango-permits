class CanTango::Config
  class Permits
    module Accounts
      attr_reader :accounts

      def accounts
        @accounts ||= Hash.new
      end

      def account_for name
        accounts[name.to_sym]
      end
    end
  end
end