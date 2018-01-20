class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.string :subscriber
      t.string :country
      t.string :status
      t.references :carrier, foreign_key: true

      t.timestamps
    end
  end
end
