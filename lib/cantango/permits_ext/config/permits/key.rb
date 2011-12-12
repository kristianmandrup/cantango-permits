class CanTango::Config
  class Permits
    class Key
      include Singleton

      def hash_for ability
        create_for(ability).value
      end

      def create_for ability
        ability.respond_to?(:subject) ? maker.create_for(ability) : maker.new(ability)
      end

      def maker
        CanTango::Ability::Cache::SimpleKey
      end
    end
  end
end