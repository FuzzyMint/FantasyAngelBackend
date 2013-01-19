class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.integer :angelListID
      t.string :name
      t.string :logo_url
      t.string :thumb_url
      t.text :product_desc
      t.text :high_concept

      t.timestamps
    end
  end
end
