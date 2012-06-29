# require 'spec_helper'
# require 'fixtures/models'

# class UserRolePermit < CanTango::Permit::Role
#   def initialize ability
#     super
#   end

#   protected

#   def calc_rules
#     can(:read, Post) if $test == true
#   end
# end

# class AdminRolePermit < CanTango::Permit::Role
#   def initialize ability
#     super
#   end

#   protected

#   def calc_rules
#     can(:read, Article) do |article|
#       $test == true
#     end
#   end
# end

# describe CanTango::Permits::Permit::Role do
#   before do
#     @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
#     @ua = UserAccount.new user, :roles => [:admin, :user], :role_groups => []
#     @user.account = @ua

#     @ability = CanTango::Ability::Base.new user_account
#     @permit = AdminRolePermit.new ability
#   end

#   before(:each) do
#     CanTango.configure do |config|
#       config.engine(:permit).set :on
#     end
#   end

#   describe 'Having some dynamic conditions based on global things' do
#     it "shoud react if global thing changed" do
#       pending
#       $test = true
#       ability.can?(:read, Article.new).should == true
#       $test = false
#       ability.can?(:read, Article.new).should == false
#     end
#   end
  
#   describe 'Having some dynamic conditions based on global things' do
#     it "shoud react if global thing changed" do
#       pending "Need to reveal CanCan's situation and caching"
#       #$test = true
#       #ability.can?(:read, Post.new).should == true
#       #$test = false
#       #ability.can?(:read, Post.new).should == false
#     end
#   end
# end