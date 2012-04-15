module Cantango
  module Generators
    class UserPermitsGenerator < Rails::Generators::Base
      desc "Creates User Permits for use with CanTango Permits"

      argument     :permits,           :type => :array,      :desc => "User Permits"

      source_root File.dirname(__FILE__) + '/../user_permit/templates'

      def main_flow
        permits.each do |permit|
          template_permit(permit)
        end
      end

      protected

      attr_accessor :permit_name

      def template_license name
        self.permit_name = name
        template "user_permit.erb", "app/permit/user/#{name}.rb"
      end
    end
  end
end
