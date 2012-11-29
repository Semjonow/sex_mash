class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.string  :subject, null: false, default: ''
      t.string  :body,    null: false, default: ''

      t.timestamps
    end

    add_foreign_key(:messages, :users, column: :sender_id, dependent: :delete)
    add_foreign_key(:messages, :users, column: :reciever_id, dependent: :delete)
  end
end
