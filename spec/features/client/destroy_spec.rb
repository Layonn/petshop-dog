require 'rails_helper'

RSpec.feature "Destroy client", type: :feature do
  scenario "Link to destroy client" do
    visit clients_path
    #expect(page).to have_link 'Excluir'
  end
end
