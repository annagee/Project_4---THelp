class Article < ActiveRecord::Base
  has_many :tags
  has_many :tags, through: :article_tag
end
