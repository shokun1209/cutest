class ChangeDataPhotoDateToPhotos < ActiveRecord::Migration[6.0]
  def change
    change_column :photos, :photo_date, :string
  end
end
