class ArticlesController < ApplicationController
  # before_action :ensure_admin!, except: [:index, :show]
  
  def index
   @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
    # @article = Article.word_limiter(@article, 50)
  end
  
  def create
    @article = Article.new(article_params)
     respond_to do |format|
      if @article.save
        format.js
        format.html {redirect_to @article} 
      else
      end
     end
  end 

  private
   def article_params
     params.require(:article).permit(:author, :header, :content, :all_tags, :image)

   end
end
