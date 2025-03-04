class CreateAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :availabilities do |t|
      t.integer :user_id
      t.time :start_time
      t.time :end_time
      t.string :day_of_week

      t.timestamps
    end
  end
end
