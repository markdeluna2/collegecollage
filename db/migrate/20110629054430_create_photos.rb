class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title
      t.integer :user_id
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :camera
      t.string :comment
      

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
