class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :g_id
      t.string :label_ids
      t.string :name
      t.string :message
      t.string :message_type
      t.string :read
      t.references :campaign, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
