require 'cantango/class_methods'

module CanTango
  autoload_modules :Builder, :Factory, :Finder, :License, :Permit
  autoload_modules :Engine, :Executor, :Macros
  autoload_modules :ClassMethods
end

[:user_type, :account_type, :role, :role_group, :special].each do |permit|
  "CanTango::Permit::#{permit.to_s.camelize}".constantize
end