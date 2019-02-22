class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.references :user, foreign_key: true
      t.references :enterprise, foreign_key: true
      t.string :memo

      t.timestamps
    end
  end
end
