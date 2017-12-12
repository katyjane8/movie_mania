require 'rails_helper'

describe "As a user, when I visit '/movies/new'" do
  context "they fill out a form to create a new movie" do
    it "creates a new movie" do
      director = Director.create(name: "Ali")

      # visit "/directors/#{director.id}/movies/new"
      visit new_director_movie_path(director)

      fill_in "movie[title]", with: "Finding Nemo"
      fill_in "movie[description]", with: "Clown fish are not funny"

      click_on "Create Movie"

      expect(current_path).to eq("/movies/#{Movie.last.id}")
      expect(page).to have_content("Finding Nemo")
      expect(page).to have_content("Clown fish are not funny")
      expect(page).to have_content(director.name)
    end
  end
end
