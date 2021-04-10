class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.references :uploader_id
      t.references :image
      t.date :photo_date
      t.string :content_type
      t.timestamps
    end
  end
end

