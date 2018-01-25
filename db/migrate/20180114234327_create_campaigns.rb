class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :g_id
      t.string :name
      t.string :message
      t.integer :unread_messages
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
