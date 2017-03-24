require 'rails_helper'

RSpec.feature "Update dog", type: :feature do
  generic_dog_breed = Breed.new
  generic_dog_breed.name = 'Beagle'
  generic_dog_date = Date.parse('14 Mai 2017')
  generic_dog_owner = Client.new
  generic_dog_owner.name = 'Layonn'
  generic_dog_name = 'Test'
  generic_dog_gender = 'Masculino'
  generic_dog_castrated = 'Sim'

  dog = Dog.new
  dog.name = 'Test'
  dog.breed_id = generic_dog_breed.id
  dog.gender = generic_dog_gender
  dog.castrated = generic_dog_castrated
  dog.born_in = generic_dog_date
  dog.last_appointment = generic_dog_date
  dog.client_id = generic_dog_owner.id

  scenario "Link to update dog" do
    visit breeds_path
    #expect(page).to have_link 'Alterar'
  end
=begin
  scenario "Update a dog" do
    visit edit_dog_path(dog)
    expect(page).to have_content 'Alterar'
    fill_in 'Nome', with: dog.name
    select dog.breed_id, from: 'dog_breed_id'
    select dog.gender, from: 'dog_gender'
    select dog.castrated, from: 'dog_castrated'
    fill_in 'Data de nascimento', with: dog.born_in
    fill_in 'Última passagem pela clinica', with: dog.last_appointment
    fill_in 'Proprietário', with: generic_dog_owner.name

    click_button 'Enviar'
    expect(page).to have_current_path(dogs_path)
    expect(page).to have_content('Cachorro atualizado com sucesso.')

  end
=end

end
