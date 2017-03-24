class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.string :castrated, null: false
      t.datetime :born_in, null: false
      t.datetime :last_appointment

      t.belongs_to :breed, null: false

      t.timestamps
    end
  end
end
