require 'rails_helper'
require 'capybara/rspec'

RSpec.describe "SiteLayouts" do
  describe "GET /site_layouts" do
    it "has the help, about and contact links in the root path" do
      get root_path
      # get site_layouts_path

      # expect(response.body).to have_link("Help", href: help_path)
      assert_select "a[href=?]", help_path
      assert_select "a[href=?]", about_path
      assert_select "a[href=?]", contact_path
      # expect(response).to have_http_status(200)
    end
  end
end
