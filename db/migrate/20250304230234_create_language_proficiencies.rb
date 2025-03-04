class CreateLanguageProficiencies < ActiveRecord::Migration[7.1]
  def change
    create_table :language_proficiencies do |t|
      t.integer :language_id
      t.string :proficiency_level
      t.integer :user_id

      t.timestamps
    end
  end
end
