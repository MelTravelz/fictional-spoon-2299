require 'rails_helper'

RSpec.describe '/ingredients', type: :feature do
  let!(:tomato) { Ingredient.create!(name: "tomato", cost: 2) }
  let!(:mozzarella) { Ingredient.create!(name: "mozzarella", cost: 5) }
  let!(:garlic) { Ingredient.create!(name: "garlic", cost: 1) }

  it 'US1 - should display list of all ingredients & attributes' do
    visit '/ingredients'

    expect(page).to have_content("#{tomato.name}: #{tomato.cost}")
    expect(page).to have_content("#{mozzarella.name}: #{mozzarella.cost}")
    expect(page).to have_content("#{garlic.name}: #{garlic.cost}")
  end

  it 'Extention1 - should show list of ingredients sorted alphabetically by name' do
    visit '/ingredients'

    expect(garlic.name).to appear_before(mozzarella.name)
    expect(mozzarella.name).to appear_before(tomato.name)
  end
end