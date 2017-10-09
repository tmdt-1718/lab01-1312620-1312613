class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :user, foreign_key: true
      t.integer :view, default: 0
      t.string :source

      t.timestamps
    end
  end
end
