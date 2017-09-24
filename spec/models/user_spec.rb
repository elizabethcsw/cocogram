require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  describe "non blank" do
    it "should be valid" do
      expect(@user.valid?).to eq true
    end

    it "name should be present" do
      @user.name = "     "
      expect(@user.valid?).to eq false
    end

    it "email should be present" do
      @user.email = "     "
      expect(@user.valid?).to eq false
    end
  end

  describe "appropriate length" do
    it "name should not be too long" do
      @user.name = "a" * 51
      expect(@user.valid?).to eq false
    end

    it "email should not be too long" do
      @user.email = "a" * 255 + "@hello.com"
      expect(@user.valid?).to eq false
    end
  end


  describe "email validation" do

    it "should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user.valid?).to eq true
        p "#{valid_address} should be valid"
      end
    end

    it "should accept valid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com  foo@bar..com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user.valid?).to eq false
        p "#{invalid_address} should not be invalid"
      end
    end

    it "should be unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user.valid?).to eq false
    end

  end

  describe "password" do
    it "non blank" do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user.valid?).to eq false
    end

    it "minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user.valid?).to eq false
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
