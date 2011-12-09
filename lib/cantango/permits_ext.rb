module CanTango
  sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
    sweetload :Ability, :Configuration, :Builder, :Factory, :Finder, :Engine, :Macros
    sweetload :ClassMethods
  end
end
