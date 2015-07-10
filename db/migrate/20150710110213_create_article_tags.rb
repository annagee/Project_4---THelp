class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.string :tag_id
      t.string :article_id

      t.timestamps null: false
    end
  end
end
