module CanTango
  module Permit
    class UserType < Base
      module ClassMethods
        def hash_key
          permit_name(self)
        end
      end
      extend ClassMethods

      # creates the permit
      # @param [Ability] the ability
      def initialize ability
        super
      end

      def valid?
        debug_invalid if !(subject_user == permit_user)
        subject_user == permit_user
      end

      protected

      def debug_invalid
        debug "Not a valid permit for subject: (user class) #{subject_user} != #{name} (permit user)"
      end

      def subject_user
        subject.class.name.underscore.to_sym
      end
    end
  end
end

