require 'rails_helper'

RSpec.feature 'Add new client', type: :feature do
  scenario 'Link to a new client' do
    visit root_path
    click_link 'Clientes'
    expect(page).to have_current_path(clients_path)
    click_link 'Cadastrar'
    expect(page).to have_current_path(new_client_path)
  end

  scenario 'Create a new client' do
      visit new_client_path
      expect(page).to have_content 'Cadastrar'
      fill_in 'Nome', with: 'Test'
      click_button 'Enviar'
      expect(page).to have_current_path(clients_path)
      expect(page).to have_content('Cliente cadastrado com sucesso.')
  end

  scenario 'Create a new client with invalid values' do
    visit new_client_path
    fill_in 'Nome', with: ''
    click_button 'Enviar'
    expect(page).to have_content('Nome não pode ficar em branco')
  end

end
