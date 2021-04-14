class AddDetailsToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :content_type, :string
  end
end
