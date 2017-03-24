class Dog < ApplicationRecord
  validates_presence_of :name, :gender, :castrated, :born_in, :last_appointment
  validates :gender, inclusion: { in: ['Masculino', 'Feminino'] }
  belongs_to :breed
  belongs_to :client
end
