class CreatePersons < ActiveRecord::Migration[5.2]
  def change
    create_table :persons do |t|
      #add column
      t.string :name, null: false
      t.integer :house_id
    end

  end
end
