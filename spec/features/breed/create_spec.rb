require 'rails_helper'

RSpec.feature 'Add new breed', type: :feature do
  scenario 'Link to a new breed' do
    visit root_path
    click_link 'Raças'
    expect(page).to have_current_path(breeds_path)
    click_link 'Cadastrar'
    expect(page).to have_current_path(new_breed_path)
  end

  scenario 'Create a new breed' do
      visit new_breed_path
      expect(page).to have_content 'Cadastrar'
      fill_in 'Nome', with: 'Test'
      click_button 'Enviar'
      expect(page).to have_current_path(breeds_path)
      expect(page).to have_content('Raça cadastrada com sucesso.')
  end

  scenario 'Create a new breed with invalid values' do
    visit new_breed_path
    fill_in 'Nome', with: ''
    click_button 'Enviar'
    expect(page).to have_content('Nome não pode ficar em branco')
  end
  
end
