class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :chapeau
      t.string :thumbnail
      t.string :content
      t.integer :view

      t.timestamps
    end
  end
end
