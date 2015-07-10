class Question < ActiveRecord::Base
 belongs_to :user
 has_many :comments
 has_many :tags
 has_many :tags, through: :question_tag

   def all_tags = (names)
      self.tags = names.split(",").map do |name|
       Tag.where(name: name.strip).first_or_create!
     end
   end

   def all_tags
    self.tags.map(&:name).join(",")
  end
end
