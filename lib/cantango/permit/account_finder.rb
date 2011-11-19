module CanTango
  class Permit
    class AccountFinder
      attr_reader :user_account

      def initialize name, options = {}
        super
        @account = options[:account]
      end

      protected

      def found_permit
        @found_permit ||= permits[name] if registered? account.class
      end

      def permits
        account_permits.registered_for(type)
      end

      def account_permits
        registered_permits.send(account_name)
      end

      def registered? account
        CanTango.config.user_accounts.registered_class? account
      end

      def account_name
        account.class.name.underscore
      end

      # this is used to namespace role permits for a specific type of user account
      # this allows role permits to be defined differently for each user account (and hence sub application) if need be
      # otherwise it will fall back to the generic role permit (the one which is not wrapped in a user account namespace)
      def permit_class
        [permit_ns , permit_class].join('::')
      end

      def permit_ns
        "#{account.class}Permits"
      end
    end
  end
end