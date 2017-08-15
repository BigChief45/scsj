class CreateTrialPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :trial_people do |t|
      t.references :trial
      t.references :person, index: true
      t.references :triable, polymorphic: true

      t.timestamps
    end
  end
end
