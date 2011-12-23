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
        debug_invalid unless user_type == name
        user_type == name
      end

      protected

      def debug_invalid
        debug "Not a valid permit for subject: (user class) #{user_type} != #{name} (permit user)"
      end

      def user_type
        user.class.name.underscore.to_sym
      end
    end
  end
end

