class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.integer :partner_id
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.text :notes
      t.integer :user_id
      t.integer :language_id
      t.integer :status
      t.string :location

      t.timestamps
    end
  end
end
