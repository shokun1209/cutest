class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.date :photo_date
      t.string :content_type
      t.references :uploader
      t.timestamps
    end
  end
end
