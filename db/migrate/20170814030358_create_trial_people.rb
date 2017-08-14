class CreateTrialPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :trial_people do |t|
      t.references :trial, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
