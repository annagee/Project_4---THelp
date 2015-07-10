class Tag < ActiveRecord::Base
  has_many :article_tag
  has_many :articles, through: :article_tag
  has_many :question_tag
  has_many :questions, through: :question_tag
end
