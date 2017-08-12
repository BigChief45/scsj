class CreateTrials < ActiveRecord::Migration[5.1]
  def change
    create_table :trials do |t|
      t.string :title
      t.text :description
      t.boolean :secret, default: false

      t.timestamps
    end
  end
end
