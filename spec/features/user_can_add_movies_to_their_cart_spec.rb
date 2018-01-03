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

  scenario "the message correctly increments for multiple movies" do
    visit movies_path

    click_button "Add Movie"

    expect(page).to have_content("You now have 1 #{@movie.title} in your cart.")

    click_button "Add Movie"

    expect(page).to have_content("You now have 2 #{@movie.title}s in your cart.")
  end

  scenario "the total number of items in the cart increments" do
    visit movies_path

    expect(page).to have_content("Cart: 0")

    click_button "Add Movie"

    expect(page).to have_content("Cart: 1")
  end
end
