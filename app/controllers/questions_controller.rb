class QuestionsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index 
    if params[:tag]
      @questions = Question.tagged_with(params[:tag])
    else
      @questions = Question.all.order("created_at DESC")
    end
  end

  def show
  
  end

  def new
    @question = current_user.questions.build
  end

  def create
    @question = current_user.questions.build(question_params)
     respond_to do |format|

      if @question.save
          format.js 
          # looks for create,js.erb in views
      else
        format.html {render root_path}
      end
  end
end 

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end
  
  def destroy
    @question.destroy
    redirect_to root_path

  end


  private

  def find_post
    @question = Question.find(params[:id])
  end 

  def question_params
    params.require(:question).permit(:title, :content, :all_tags)
  end
end
