class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :content
      t.string :comment

      t.timestamps null: false
    end
  end
end
