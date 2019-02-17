class CreateEnterprises < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.string :url
      t.string :name_of_president
      t.date :foundation_date
      t.string :location
      t.string :business_contents
      t.integer :number_of_employees
      t.float :average_age

      t.timestamps
    end
  end
end
