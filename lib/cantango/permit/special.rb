module CanTango
  module Permit
    class Special < Base
      def initialize ability
        super
      end

      def self.hash_key
        nil
      end

      def valid?
        true
      end
    end
  end
end
