module CanTango
  class Permit
    class Finder
      include CanTango::Helpers::Debug

      # This class is used to find the right permit, possible scoped for a specific user account
      attr_reader :user_account, :permit_type, :name

      def initialize name, permit_type, user_account = nil
        @user_account = user_account
        @permit_type = permit_type
        @name = name.to_s.underscore.to_sym
      end

      def get_permit
        raise find_error if !retrieve_permit
        retrieve_permit
      end

      def account_finder
        @account_finder = CanTango::Permit::Finder::Account.new user_account
      end

      protected

      def account_permit
        account_finder.find name
      end

      def find_error
        "Permit for #{permit_type} #{name} could not be loaded. Define class: #{permit_class} (or wrapped in account scope)"
      end

      def retrieve_permit
        @found_permit ||= permits_to_try.first
      end

      def permits_to_try
        [account_permit, permit].compact
      end

      def registered_account? account
        CanTango.config.user_accounts.registered_class? account
      end

      def permit
        found = registered_permits.registered_for permit_type, name
        debug permit_msg(found)
        found
      end

      def permit_msg found
        found.nil? ? "no permits found for #{name}" : "permits registered for name: #{name} -> #{found}"
      end

      def permits
        registered_permits.registered_for(permit_type)
      end

      def registered_permits
        CanTango.config.permits
      end

      def permit_class
        "#{name.to_s.camelize}Permit"
      end
    end
  end
end
