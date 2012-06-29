require 'spec_helper'
require 'fixtures/models'
# require 'cantango/rspec'

def config_folder
  File.dirname(__FILE__)+ "/../fixtures/config/"
end

# CanTango.configure do |config|
#   config.clear!
#   config.engine(:permit).set :on
#   config.debug!
# end

# class UserPermit < CanTango::Permit::UserType
#   def initialize ability
#     super
#   end

#   protected

#   def calc_rules
#     can :read, Article
#   end
# end

# describe CanTango::Engine::Permit do
#   context 'cache' do
#     before do
#       @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
#       @ability = CanTango::Ability::Base.new @user
#     end

#     subject { CanTango::Engine::Permit.new ability }

#     describe '#execute!' do
#       before do
#         subject.execute!
#       end

#       it 'engine should have rules' do
#         subject.send(:rules).should_not be_empty
#       end

#       it 'engine cache should have rules' do
#         subject.cache.empty?.should be_false
#       end
#     end
#   end
# end
