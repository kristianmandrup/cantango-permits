module CanTango
  module Finder
    module Permit
      class Base < CanTango::Finder::Base
        include CanTango::Helpers::Debug

        # This class is used to find the right permit, possible scoped for a specific user account
        attr_reader :account, :type, :name

        def initialize name, options = {}
          super
          @account = options[:account]
        end

        def get_permit
          raise find_error if !retrieve_permit
          retrieve_permit
        end

        def account_finder
          @account_finder = CanTango::Permit::Finder::Account.new account
        end

        protected

        def permit_msg found
          found.nil? ? "no permits found for #{name}" : "permits registered for name: #{name} -> #{found}"
        end

        def found_permit
          @found_permit ||= registered_permits.registered_for type, name
        end
        alias_method :registered?, :found_permit

        def permits
          registered_permits.registered_for(type)
        end

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

        def registered_permits
          CanTango.config.permits
        end
      end
    end
  end
end