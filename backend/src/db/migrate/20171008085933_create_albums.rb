class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :cover
      t.references :user, foreign_key: true
      t.integer :view, default: 0

      t.timestamps
    end
  end
end
