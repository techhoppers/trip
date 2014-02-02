class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string  :title
      t.text    :description
      t.text    :short_description
      t.integer :category_id
      t.integer :city_id
      t.float   :latitude
      t.float   :longitude
      t.string  :url
      t.timestamps
    end
  end
end
