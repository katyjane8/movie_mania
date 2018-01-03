require 'rails_helper'

RSpec.feature "When a user adds movies to their cart" do
  before(:each) do
    @movie = create(:movie)
  end

  scenario "a message is displayed" do
    visit movies_path

    click_button "Add Movie"

    expect(page).to have_content("You now have 1 #{@movie.title} in your cart.")
  end
end
