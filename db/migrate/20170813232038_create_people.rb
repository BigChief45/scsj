class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.string :id_number
      t.date :birth_date

      t.timestamps
    end
  end
end
