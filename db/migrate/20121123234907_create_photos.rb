class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string  :pid,              null: false, default: ''
      t.string  :src_small,        null: false, default: ''
      t.string  :src_big,          null: false, default: ''

      t.timestamps
    end

    add_foreign_key(:photos, :users, dependent: :delete)
    add_index(:photos, :pid, unique: true)
  end
end
