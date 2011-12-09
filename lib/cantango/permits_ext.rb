module CanTango
  sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
    sweetload :Ability, :Configuration, :Builder, :Factory
    sweetload :Finder, :Engine, :Macros, :Parser, :Loader
    sweetload :ClassMethods
  end
end
