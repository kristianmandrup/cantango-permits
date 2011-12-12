module CanTango
  class Config
    class Permits
      include Singleton
      include CanTango::Helpers::Debug
      include CanTango::Registry::Permit

      sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
        sweetload :Execution, :Tracking, :Enabling, :Disabling
        sweetload :Accounts, :Types, :Registration, :Key
      end

      include Execution
      include Tracking
      include Enabling
      include Accounts
      include Registration

      attr_writer :available, :default_permits

      def available
        @available ||= default_permits
      end

      protected

      def default_permits
        @default_permits ||= {}
      end

      # permit types
      def types
        Types.instance
      end

      # permit types
      def key
        Key.instance
      end
    end
  end
end