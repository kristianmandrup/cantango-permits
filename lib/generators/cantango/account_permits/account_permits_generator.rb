module Cantango
  module Generators
    class AccountPermitsGenerator < Rails::Generators::Base
      desc "Creates Account Permits for use with CanTango Permits"

      argument     :permits,           :type => :array,      :desc => "Account Permits"

      source_root File.dirname(__FILE__) + '/../account_permit/templates'

      def main_flow
        permits.each do |permit|
          template_permit(permit)
        end
      end

      protected

      attr_accessor :permit_name

      def template_license name
        self.permit_name = name
        template "account_permit.erb", "app/permit/account/#{name}.rb"
      end
    end
  end
end
