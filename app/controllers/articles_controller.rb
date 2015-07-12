class ArticlesController < ApplicationController

  def index
   @articles = Article.all
  end
  
  def create
    @article = Article.new(article_params)
     respond_to do |format|
      if @article.save
        format.js
      else
      format.html{render root_path}  
      end
     end
  end 

  private
   def article_params
     params.require(:article).permit(:author, :header, :content, :all_tags)
   end
end
