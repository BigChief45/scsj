class CreateTrials < ActiveRecord::Migration[5.1]
  def change
    create_table :trials do |t|
      t.string :title
      t.integer :trial_type, default: 0
      t.text :description
      t.date :start_date
      t.boolean :secret, default: false

      t.integer :judge_id, foreign_key: true
      t.integer :plaintiffs_lawyer_id, foreign_key: true
      t.integer :defendants_lawyer_id, foreign_key: true

      t.timestamps
    end
  end
end
