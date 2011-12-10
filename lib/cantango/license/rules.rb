module CanTango
  class License
    module Rules
      def can(action, subject, conditions = nil, &block)
        ability.can action, subject, conditions, &block
      end

      def cannot(action, subject, conditions = nil, &block)
        ability.cannot action, subject, conditions, &block
      end

      def owns(user_account, clazz, ownership_relation = :user_id, user_id_attribute = :id)
        ability.owns user_account, clazz, ownership_relation, user_id_attribute
      end
    end
  end
end
