module CanTango
  module Permit
    class User < Base
      attr_accessor :key, :match_value

      # creates the permit
      # @param [Permits::Ability] the ability
      # @param [Hash] the options
      def initialize ability
        super
      end

      def self.hash_key
        nil
      end

      def valid?
        debug_invalid if !match?
        true
      end

      protected

      def match?
        return false if !subject.respond_to? key
        subject.send(key) == match_value
      end

      def debug_invalid
        debug "Not a valid permit for subject: #{key} != #{match_value}"
      end
    end
  end
end


