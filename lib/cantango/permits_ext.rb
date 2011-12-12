module CanTango
  sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
    sweetload :Ability, :Registry, :Config, :Builder, :Factory
    sweetload :Finder, :Engine, :Macros, :Parser, :Loader
    sweetload :ClassMethods
  end
end
