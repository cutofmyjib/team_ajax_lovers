class SurveyUsers < ActiveRecord::Migration
  def change
    create_table :survey_users do |t|
      t.integer :user_id
      t.integer :survey_id
    end

    add_index :survey_users, :user_id
    add_index :survey_users, :survey_id
  end
end
