require 'rails_helper'

describe "As a user, when I visit '/directors/new'" do
  context "they fill out a form with name" do
    it "creates a new director and redirects to director show" do
      # visit '/directors/new'
      visit new_director_path

      expect(page.status_code).to eq(200)
      expect(page).to have_content("Create a New Director")
      expect(page).to have_content("Name")

      fill_in "director[name]", with: "Steven Spielberg"

      click_on "Create Director"
        latest_director = Director.last
      expect(current_path).to eq("/directors/#{Director.last.id}")
      expect(page).to have_content("#{latest_director.name}")
    end
  end
end
