class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :header
      t.string :author
      t.text :content

      t.timestamps null: false
    end
  end
end
