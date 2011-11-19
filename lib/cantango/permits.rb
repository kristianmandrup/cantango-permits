module CanTango
  autoload_modules :Builder, :Factory, :Finder, :License, :Permit
  autoload_modules :Engine, :Executor, :Macros
end

# module CanTango
#   module Macros
#     autoload_modules :Permits
#   end
# end
# 
# module CanTango
#   module Engine
#     autoload_modules :Permits
#   end
# end

# module CanTango
#   module Factory
#     autoload_modules :Permit
#   end
# end

# 
# #--- Permit
# 
# 
# 
# module CanTango
#   module Executor
#     autoload_modules :Base, :Permit, :SpecialPermit
#   end
# end
# 
# module CanTango
#   module Builder
#     autoload_modules :Permit, :RoleGroupPermit, :RolePermit, :UserTypePermit, :AccountTypePermit
#   end
# end