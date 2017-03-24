require 'rails_helper'

RSpec.feature "Update client", type: :feature do
  scenario "Link to update client" do
    visit clients_path
    #expect(page).to have_link 'Alterar'
  end

  scenario "Update a client" do
    client = Client.create!(name: 'Breed test')
    visit edit_client_path(client)
    expect(page).to have_content 'Alterar'
    click_button 'Enviar'
    expect(page).to have_current_path(clients_path)
  end

  scenario 'Update a client with invalid values' do
    client = Client.create!(name: 'Breed test')
    visit edit_client_path(client)
    fill_in 'Nome', with: ''
    click_button 'Enviar'
    expect(page).to have_content('Nome não pode ficar em branco')
  end

end
