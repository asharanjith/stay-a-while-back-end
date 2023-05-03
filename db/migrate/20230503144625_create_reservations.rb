class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :no_of_persons
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
      t.references :home_stay, null: false, foreign_key: true

      t.timestamps
    end
  end
end
