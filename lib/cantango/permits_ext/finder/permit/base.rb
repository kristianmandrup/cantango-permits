module CanTango
  module Finder
    module Permit
      class Base < CanTango::Finder::Base
        include CanTango::Helpers::Debug

        # This class is used to find the right permit, possible scoped for a specific user account
        attr_reader :account

        def initialize name, options = {}
          super
          @account = options[:account]
        end

        def find_permit
          raise find_error if !retrieve_permit
          retrieve_permit
        end

        def account_finder name
          @account_finder ||= CanTango::Finder::Permit::Account.new name, :type => type, :account => account
        end

        protected

        def permit_msg found
          found.nil? ? "no permits found for #{name}" : "permits registered for name: #{name} -> #{found}"
        end

        def found_permit
          @found_permit ||= permits[name]
        end
        alias_method :registered?, :found_permit

        def account_permit
          account_finder(name).find_permit
        end

        def find_error
          "The #{type} Permit for #{name} could not be loaded. You need to define a coresponding Permit class"
        end

        def retrieve_permit
          @found_permit ||= permits_to_try.first
        end

        def permits_to_try
          @permits_to_try ||= [account_permit, permit].compact
        end
      end
    end
  end
end