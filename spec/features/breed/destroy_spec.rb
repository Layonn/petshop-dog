require 'rails_helper'

RSpec.feature "Destroy breed", type: :feature do
  scenario "Link to destroy breed" do
    visit breeds_path
    #expect(page).to have_link 'Excluir'
  end
end
