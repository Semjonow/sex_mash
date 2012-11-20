class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string  :country, null: false, default: ''
      t.string  :state,   null: false, default: ''
      t.string  :city,    null: false, default: ''
      t.string  :address, null: false, default: ''
      t.float   :lat,     null: false, default: 0.0
      t.float   :lng,     null: false, default: 0.0
      t.boolean :gmaps,   null: false, default: false

      t.timestamps
    end

    add_foreign_key(:locations, :users, dependent: :delete)
  end
end
