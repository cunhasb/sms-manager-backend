class CreateCarriers < ActiveRecord::Migration[5.1]
  def change
    create_table :carriers do |t|
      t.string :name
      t.string :country
      t.string :gateway_text
      t.string :gateway_mime
      t.string :status

      t.timestamps
    end
  end
end
