class Question < ActiveRecord::Base
 belongs_to :user
 has_many :comments, dependent: :destroy
 has_many :question_tags,  dependent: :destroy
 has_many :tags, through: :question_tags

   def all_tags=(names)
      self.tags=names.split(",").map do |name|
       Tag.where(name: name.strip).first_or_create!
     end
   end

   def all_tags 
    self.tags.map(&:name).join(", ")
   end 

    def self.tagged_with(name)
      Tag.find_by_name!(name).questions
    end
end
