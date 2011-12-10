require 'sugar-high/array'
require 'sugar-high/blank'
require 'hashie'
require 'sweetloader'

SweetLoader.namespaces = {:CanTango => 'cantango'}
SweetLoader.mode = :require

module CanTango
  sweetload :License, :Permit, :Executor
end

require 'cantango/permits_ext'

module CanTango
  module Permit
    sweetload :Base
    sweetload :UserType, :AccountType, :Special, :User
  end
end
