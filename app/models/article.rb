class Article < ActiveRecord::Base
  has_many :article_tags
  has_many :tags, through: :article_tags

  def all_tags=(names)
    self.tags = names.split(", ").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
   end
   
   def all_tags
     self.tags.map(&:name).join(", ") 
    end 
end
