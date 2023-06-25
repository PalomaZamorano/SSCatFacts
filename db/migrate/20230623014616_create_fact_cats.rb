class CreateFactCats < ActiveRecord::Migration[7.0]
  def change
    create_table :fact_cats do |t|
      t.string :fact
      t.integer :length
      t.integer  :clicks, default: 0, null: false
      t.timestamps
    end
  end
end
