class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :flickr_user
      t.boolean :valid_request

      t.timestamps
    end
  end
end
