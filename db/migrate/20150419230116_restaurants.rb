class Restaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :yelp_url
      t.string :review_count
      t.string :rating
      t.string :address
      t.string :phone
      t.string :category

      t.timestamps
    end
  end
end
