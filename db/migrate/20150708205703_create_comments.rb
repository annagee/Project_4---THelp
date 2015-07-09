class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :author
      t.string :time

      t.timestamps null: false
    end
  end
end
