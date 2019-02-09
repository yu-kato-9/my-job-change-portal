class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :url
      t.integer :kind
      t.string :memo
      t.string :name_of_person_in_charge
      t.string :tel_of_person_in_charge
      t.string :email_of_person_in_charge

      t.timestamps
    end
  end
end
