class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.string :tag_id
      t.string :question_id

      t.timestamps null: false
    end
  end
end
