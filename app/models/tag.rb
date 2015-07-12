class Tag < ActiveRecord::Base
  has_many :article_tags
  has_many :articles, through: :article_tags
  has_many :question_tags
  has_many :questions, through: :question_tags

  def self counts
    self.select("name, count(question_tags.tag_id) as count").joins(:question_tags).group("question_tags.tag_id")
  end
end
