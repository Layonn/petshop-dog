class AddClientToDogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :dogs, :client, foreign_key: true
  end
end
