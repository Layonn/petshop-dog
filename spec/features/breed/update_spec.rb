require 'rails_helper'

RSpec.feature "Update breed", type: :feature do
  scenario "Link to update breed" do
    visit breeds_path
    #expect(page).to have_link 'Alterar'
  end

  scenario "Update a breed" do
    breed = Breed.create!(name: 'Breed test')
    visit edit_breed_path(breed)
    expect(page).to have_content 'Alterar'
    click_button 'Enviar'
    expect(page).to have_current_path(breeds_path)
  end

  scenario 'Update a breed with invalid values' do
    breed = Breed.create!(name: 'Breed test')
    visit edit_breed_path(breed)
    fill_in 'Nome', with: ''
    click_button 'Enviar'
    expect(page).to have_content('Nome não pode ficar em branco')
  end

end
