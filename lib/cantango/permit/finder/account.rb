module CanTango
  class Permit
    class AccountFinder
      include CanTango::Helpers::Debug

      attr_reader :user_account, :name

      # TODO: User/Account cases should be handled somehow following is just interim measure
      def account_permit
        return nil if !registered_account? user_account.class
        found = account_permits[name]
        debug account_permit_msg(found)
        found
      rescue
        nil
      end

      def account_permit_msg found
        found.nil? ? "no account permits found for #{name}" : "account permits registered for name: #{name} -> #{found}"
      end

      def account_permits
        account_permits_for_account.registered_for(permit_type)
      end

      def account_permits_for_account
        registered_permits.send(account)
      end

      def account
        user_account.class.name.underscore
      end

      # this is used to namespace role permits for a specific type of user account
      # this allows role permits to be defined differently for each user account (and hence sub application) if need be
      # otherwise it will fall back to the generic role permit (the one which is not wrapped in a user account namespace)
      def account_permit_class
        [account_permit_ns , permit_class].join('::')
      end

      def account_permit_ns
        "#{user_account.class}Permits"
      end
    end
  end
end