$LOAD_PATH.unshift File.dirname(__FILE__)

require 'current_users'

module CurrentUserAccounts
  include ::CurrentUsers

  def self.included(base)
    base.extend ::CurrentUsers
  end

  def current_user_account
    @current_user_account ||= ::UserAccount.new(current_user, :roles => [:user])
  end
  
  def current_admin_account
    @current_admin_account ||= ::AdminAccount.new(current_admin, :roles => [:admin])
  end
end

