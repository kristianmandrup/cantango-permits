module CanTango
  module Permit
    class AccountType < Base
      module ClassMethods
        def type
          :account
        end

        def hash_key
          account_type_name(self)
        end
      end
      extend ClassMethods
      
      # creates the permit
      # @param [Permits::Ability] the ability
      # @param [Hash] the options
      def initialize ability
        super
      end

      def valid?
        debug_invalid if !(subject_name == account_name)
        subject_name == account_name
      end

      protected

      def debug_invalid
        puts "Not a valid permit for subject: (account class) #{subject_account} != #{permit_account} (permit account)" if CanTango.debug?
      end

      def subject_name
        subject.class.name.sub(/.*(Account)$/, '').underscore.to_sym
      end

      def account_name
        permit_name(self.class)
      end
    end
  end
end


