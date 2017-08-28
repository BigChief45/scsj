class CreateTrialPresentations < ActiveRecord::Migration[5.1]
  def change
    create_table :trial_presentations do |t|
      t.text :description

      t.references :user, foreign_key: true
      t.references :trial, foreign_key: true

      t.string :attachments, array: true, default: []

      t.timestamps
    end
  end
end
