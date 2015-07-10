class QuestionTag < ActiveRecord::Base
  belongs_to :questions
  belongs_to :tag
end
