require 'require_all'
require_all File.dirname(__FILE__) + '/models'

class SimpleUser
  attr_accessor :roles_list

  def initialize
    @roles_list = [:customer]
  end

  def role_groups_list
    []
  end
end

