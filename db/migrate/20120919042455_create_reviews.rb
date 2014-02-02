class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text    :message
      t.integer :user_id
      t.integer :place_id
      t.timestamps
    end
  end
end
