class CreateHomeStays < ActiveRecord::Migration[7.0]
  def change
    create_table :home_stays do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :no_of_rooms
      t.integer :rating
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
