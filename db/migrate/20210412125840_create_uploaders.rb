class CreateUploaders < ActiveRecord::Migration[6.0]
  def change
    create_table :uploaders do |t|
      t.string :line_id
      t.string :token
      t.string :name
      t.timestamps
    end
  end
end
