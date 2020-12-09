class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :flickr_user

      t.timestamps
    end
  end
end
