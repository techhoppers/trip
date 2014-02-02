class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :place_id
      t.string :title
      t.attachment :image
      t.timestamps
    end
  end
end
