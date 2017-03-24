
require 'rails_helper'

RSpec.feature 'Add new dog', type: :feature do
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

  scenario 'Link to a new dog' do
    visit root_path
    click_link 'Cachorros'
    expect(page).to have_current_path(dogs_path)
    click_link 'Cadastrar'
    expect(page).to have_current_path(new_dog_path)
  end
=begin
  scenario 'Create a new dog' do
    visit new_dog_path
    expect(page).to have_content 'Cadastrar'
    fill_in 'Nome', with: dog.name
    select generic_dog_breed.name, from: 'dog_breed_id'
    select dog.gender, from: 'dog_gender'
    select dog.castrated, from: 'dog_castrated'
    fill_in 'Data de nascimento', with: dog.born_in
    fill_in 'Última passagem pela clinica', with: dog.last_appointment
    fill_in 'Proprietário', with: generic_dog_owner.name
    click_button 'Enviar'

    expect(page).to have_current_path(dogs_path)
    expect(page).to have_content('Cachorro cadastrado com sucesso.')
  end

  scenario 'Create dog without name' do
    visit new_dog_path
    select generic_dog_breed.name, from: 'dog_breed_id'
    select dog.gender, from: 'dog_gender'
    select dog.castrated, from: 'dog_castrated'
    fill_in 'Data de nascimento', with: dog.born_in
    fill_in 'Última passagem pela clinica', with: dog.last_appointment
    fill_in 'Proprietário', with: generic_dog_owner.name
    click_button 'Enviar'

    expect(page).to have_current_path(new_dog_path)
    expect(page).to have_content('Nome não pode ficar em branco.')
  end
=end

end
