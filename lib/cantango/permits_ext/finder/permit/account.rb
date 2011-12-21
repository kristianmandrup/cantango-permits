module CanTango
  module Finder
    module Permit
      class Account < Base
        attr_reader :user_account

        def initialize name, options = {}
          super
          @account = options[:account]
        end

        def find_permit
          retrieve_permit
        end

        def permits
          account_registry.registered_for(type)
        end

        def account_registry
          CanTango.config.permits.accounts.registry_for(account)
        end

        protected

        def found_permit
          @found_permit ||= permits.registered[name]
        end

        def permits_to_try
          [permit]
        end

        # this is used to namespace role permits for a specific type of user account
        # this allows role permits to be defined differently for each user account (and hence sub application) if need be
        # otherwise it will fall back to the generic role permit (the one which is not wrapped in a user account namespace)
        def permit_class
          [permit_ns , permit_class].join('::')
        end

        def permit_ns
          "#{account}Permits"
        end
      end
    end
  end
end