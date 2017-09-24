require "rails_helper"

RSpec.feature "Static pages feature tests", :type => :feature do

  base_title = "Cocogram"

  scenario "Visiting the home page" do
    visit "/"
    # expect(page).to have_title "Home | Cocogram"
    expect(page.title).to eq "#{base_title}"
  end

  scenario "Visiting the about page" do
    visit "/about"
    expect(page).to have_title "About | #{base_title}"
    # expect(page.title).to eq "Home | Cocogram"
  end

  scenario "Visiting the help page" do
    visit "/help"
    expect(page).to have_title "Help | #{base_title}"
    # expect(page.title).to eq "Home | Cocogram"
  end

  scenario "Visiting the contact page" do
    visit "/contact"
    expect(page).to have_title "Contact | #{base_title}"
    # expect(page.title).to eq "Home | Cocogram"
  end
end
