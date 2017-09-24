require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /users_signups" do
    it "invalid signup information" do
      get signup_path

      expect {
        post users_path, params: {user: { name:  "",
        email: "user@invalid", password: "foo", password_confirmation: "bar" }}}.to change(User, :count).by(0)

      expect(response).to render_template 'users/new'
      # assert_select 'div#<CSS id for error explanation>'
      # assert_select 'div.<CSS class for field with error>'
    end

    it "valid signup information" do
      get signup_path

      expect {
        post users_path, params: {user: { name:  "123",
        email: "user@invalid.com", password: "foofoo", password_confirmation: "foofoo" }}}.to change(User, :count).by(1)
      # p "Lookhere!!!!!"
      # p Rails.env
      # p User.all
      # expect(response).to redirect_to user_path(1)
      follow_redirect!
      expect(response).to render_template 'users/show'
    end
  end
end
