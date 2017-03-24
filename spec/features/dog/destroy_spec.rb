require 'rails_helper'

RSpec.feature "Destroy dog", type: :feature do
  scenario "Link to destroy dog" do
    visit dogs_path
    #expect(page).to have_link 'Excluir'
  end
end
