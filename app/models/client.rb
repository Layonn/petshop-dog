class Client < ApplicationRecord
  validates_presence_of :name
  has_many :dogs
end
