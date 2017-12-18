require 'rails_helper'

  describe "As a user, when I visit the home page" do
    before :each do
      @director_1 = Director.create!(name: "Edgar Wright")
      @movie_1 = Movie.create(title: "Drop Dead Gorgeous", description: "a dark comedy about beauty pagents")
      @movie_2 = Movie.create(title: "Charlie Brown Christmas", description: "a holiday movie classic")
      @movie_3 = Movie.create!(title: "Shaun of the Dead", description: "GOAT", director_id: "#{@director_1.id}")
      # visit '/directors/:director_id/movies'
      visit movies_path(@director_1)
    end

    it "I see the page movie mania title" do
      expect(page.status_code).to eq(200)

      expect(page).to have_content("All Movies")
      expect(page).to have_content(@movie_3.title)
      expect(page).to have_content(@movie_3.description)
      expect(page).to have_content(@movie_3.director_id)
    end
end
