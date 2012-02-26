require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name => "Example User", :email => "user@example.com" }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    nameless_user = User.new(@attr.merge(:name => ''))
    nameless_user.should_not be_valid
  end

  it "should discriminate against long names" do
    longnamed_user = User.new(@attr.merge(:name => 'a'*51))
    longnamed_user.should_not be_valid
  end

  it "should require an email" do
    emailless_user = User.new(@attr.merge(:email => ''))
    emailless_user.should_not be_valid
  end
  
  it "should accept valid emails" do
    valid_addrs = %w[name@domain.com NAME_NAME@domain.subdomain.org name.name@domain.jp]
    valid_addrs.each do |addr|
      valid_email_user = User.new(@attr.merge(:email => addr))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid emails" do
    invalid_addrs = %w[comma@instead,com user_at_domain.org name.name@domain.]
    invalid_addrs.each do |addr|
      invalid_email_user = User.new(@attr.merge(:email => addr))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should not allow duplicate emails" do
    # put one user with this email into the db first
    User.create!(@attr)
    duplicate_email_user = User.new(@attr)
    duplicate_email_user.should_not be_valid
  end
  
  it "should not allow differing emails by case only" do
    # put one user with this email into the db first
    User.create!(@attr)
    duplicate_email_user = User.new(@attr.merge(:email => @attr[:email].upcase))
    duplicate_email_user.should_not be_valid    
  end
  
end
