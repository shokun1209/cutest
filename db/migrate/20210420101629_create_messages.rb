class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :text, null: false
      t.string :name, null: false
      t.references :photo, null: false, foreign_key: true
      t.timestamps
    end
  end
end
