class AddEmailToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :email, :string
    add_index :questions, :email, unique: true
  end
end
