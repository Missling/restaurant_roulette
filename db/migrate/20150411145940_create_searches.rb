class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :location
      t.string :description
      t.string :price
      t.integer :attendee

      t.timestamps
    end
  end
end
