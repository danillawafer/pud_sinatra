require 'spec_helper'
require_relative '../app/models/user'

describe "User" do


  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
  end

  it "Should have a 'users' table" do
    ActiveRecord::Base.connection.table_exists?(:users).should be_true
  end

  it "'users' table should have the right columns and types" do
    expected = {
      :integer => ["id"],
      :string => ["name","email","password_hash"],
      :datetime => ["created_at", "updated_at"]
    }

    ActiveRecord::Base.connection.columns(:users).each do |col|
      expected[col.type].include?(col.name).should be_true
    end
  end

  it "Should not accept user sign up without a password" do

    test_hash = {
      name: "Test User",
      email: "test_case@test_case.com",
      created_at: Date.new,
      updated_at: Date.new
    }

    test_user = User.new(test_hash)
    test_user_one.save
    test_user.should_not be_valid
  end


  it "Should not accept user sign up without a name" do

    test_hash = {
      email: "test_case@test_case.com",
      password_hash: "test_password",
      created_at: Date.new,
      updated_at: Date.new
    }

    test_user = User.new(test_hash)
    test_user_one.save
    test_user.should_not be_valid
  end


  it "Should not accept user sign up without an email" do

    test_hash = {
      name: "Test User",
      password_hash: "test_password",
      created_at: Date.new,
      updated_at: Date.new
    }

    test_user = User.new(test_hash)
    test_user_one.save
    test_user.should_not be_valid
  end

    it "Should not accept user sign up with an invalid mail format." do

    test_hash = {
      name: "Test User",
      password_hash: "test_password",
      email: "invalid_email.com",
      created_at: Date.new,
      updated_at: Date.new
    }

    test_user = User.new(test_hash)
    test_user_one.save
    test_user.should_not be_valid
  end


  it "Should not accept user sign up with a duplicated email address" do

    test_hash = {
      name: "Test User",
      email: "test_case@test_case.com",
      password_hash: "test_password",
      created_at: Date.new,
      updated_at: Date.new
    }

    User.where(email: test_hash[:email]).destroy_all

    test_user_one = User.new(test_hash)
    test_user_one.save

    test_user_two = User.new(test_hash)
    test_user_two.should_not be_valid
  end
end