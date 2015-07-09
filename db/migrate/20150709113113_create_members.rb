class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username

      t.timestamps null: false
    end
  end
end
