require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  should "the truth" do
    assert true
  end

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
  
  should  "Allowed Emails" do
    # Validating email...
    allow_value("fred@fred.com").for(:email)
    allow_value("fred@andrew.cmu.edu").for(:email)
    allow_value("my_fred@fred.org").for(:email)
    allow_value("fred123@fred.gov").for(:email)
    allow_value("my.fred@fred.net").for(:email)
  end
  
  should "Not Allow Emails" do
    !allow_value("fred").for(:email)
    !allow_value("fred@fred,com").for(:email)
    !allow_value("fred@fred.uk").for(:email)
    !allow_value("my fred@fred.com").for(:email)
    !allow_value("fred@fred.con").for(:email)
  end

  def test_validate_uniqueness_of_email
    new_user(:email => 'bar@example.com', :password => "123456").save!
    assert_equal ["has already been taken"], new_user(:email => 'bar@example.com', :password => "123456").errors[:email]
  end

  #def test_validate_password_length
   # assert_equal ["is too short (minimum is 6 characters)"], new_user(:password => 'bad').errors[:password]
 # end

  def test_require_password
    assert_equal ["can't be blank"], new_user(:password => '').errors[:password]
  end

  def test_require_well_formed_email
    assert_equal ["is invalid"], new_user(:email => 'foo@bar@example.com').errors[:email]
  end

  def new_user(attributes = {})
    attributes[:first_name] ||= 'foo'
    attributes[:last_name] ||= 'fuu'
    attributes[:email] ||= 'foo@example.com'
    attributes[:password] ||= 'abc123'
    user = User.new(attributes)
    user.valid? # run validations
    user
  end
  

  
    # # Need to do the rest with a context
#     context "Creating a context of three employees" do
#       # create the objects I want with factories
#       setup do 
#         @ed = FactoryGirl.create(:employee)
#         @ed_user = FactoryGirl.create(:user, :employee => @ed, :email => "ed@example.com")
#         @ralph = FactoryGirl.create(:employee, :first_name => "Ralph", :last_name => "Wilson", :active => false, :date_of_birth => 17.years.ago.to_date)
#         @kathryn = FactoryGirl.create(:employee, :first_name => "Kathryn", :last_name => "Janeway", :role => "manager", :date_of_birth => 30.years.ago.to_date)
#       end
# 
#       # and provide a teardown method as well
#       teardown do
#         @ed.destroy
#         @ralph.destroy
#         @kathryn.destroy
#       end
# 
#       should "allow active employees to be users" do
#         active_employee = FactoryGirl.build(:user, :employee => @kathryn, :email => "kathryn@example.com")
#         assert active_employee.valid?
#       end
# 
#       should "not allow inactive employees to be users" do
#         inactive_employee = FactoryGirl.build(:user, :employee => @ralph, :email => "ralph@example.com")
#         deny inactive_employee.valid?
#       end
#     
#       should "not allow an email address to be used by more than one user" do
#         email_taken = FactoryGirl.build(:user, :employee => @kathryn, :email => "ed@example.com")
#         deny email_taken.valid?
#       end
#     end
end
