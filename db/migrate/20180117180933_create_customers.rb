class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :status
      t.string :image_url
      t.integer :unread_messages
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
