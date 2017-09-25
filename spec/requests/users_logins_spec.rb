require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  describe "GET /users_logins" do
    # @user = users(:michael)

    it "login with invalid information" do
      get login_path
      expect(response).to render_template 'sessions/new'
      post login_path, params: { session: { email: "", password: "" } }
      expect(response).to render_template 'sessions/new'
      expect(flash[:danger]).to be_present
      get root_path
      expect(flash[:danger]).not_to be_present
    end

    it "login with valid information" do
      get signup_path

      expect {
        post users_path, params: {user: { name:  "123",
        email: "user@invalid.com", password: "foofoo", password_confirmation: "foofoo" }}}.to change(User, :count).by(1)

      get login_path
      post login_path, params: { session: { email: "user@invalid.com", password: "foofoo" }}
      follow_redirect!
      expect(response).to render_template 'users/show'
      expect(is_logged_in?).to eq true

    end

  end
end
