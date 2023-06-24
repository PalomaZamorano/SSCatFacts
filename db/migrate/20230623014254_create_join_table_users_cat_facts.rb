class CreateJoinTableUsersCatFacts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :fact_cats do |t|
       t.index [:user_id, :fact_cat_id]
       t.index [:fact_cat_id, :user_id]
    end
  end
end
